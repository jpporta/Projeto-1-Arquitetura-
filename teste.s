.data
msg0: .asciiz "\tControle de Gastos\n"
msg1: .ascii "\t\t1) Registrar Despesas\n\t\t2) Excluir Despesas\n\t\t3) Listar Despesas\n\t\t4) Exibir Gasto Mensal\n\t\t"
msg11:.asciiz"5) Exibir gastos por Categoria\n\t\t6) Exibir Ranking por Despesas\n\t\t7) Sair\n\n"
msg2: .asciiz "\nInsira o dia:"
msg3: .asciiz "\nInsira o mes:"
msg4: .asciiz "\nInsira o ano:"
msg5: .asciiz "\nInsira o tipo de gasto:"
msg6: .asciiz "\nInsira o valor gasto:"
msg9: .asciiz "/"
msg10: .asciiz "\n"

array1: .space 20

.text
.globl main


main:
	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg0  #Passa a msg para o parametro a0
	syscall

	li $v0, 4	 # Codigo SysCall p/ escrever strings
	la $a0, msg1 #Passa a msg para o parametro a0
	syscall

	li $v0, 5	 # Codigo SysCall p/ ler inteiros
	syscall

#---------------Verifica qual a opcao escolhida pelo usuario e desvia o programa para o label certo--
	addi $t0, $zero,1
	beq $t0,$v0,RegistrarDespesas #caso t0 e v0 sejam iguais da um jump

	addi $t0, $zero,2
	beq $t0,$v0,ExcluirDespesas #caso t0 e v0 sejam iguais da um jump

	addi $t0, $zero,3
	beq $t0,$v0,ListarDespesas #caso t0 e v0 sejam iguais da um jump

	addi $t0, $zero,4
	beq $t0,$v0,ExibirGastoMensal #caso t0 e v0 sejam iguais da um jump

	addi $t0, $zero,5
	beq $t0,$v0,ExibirgastosPorCategoria #caso t0 e v0 sejam iguais da um jump

	addi $t0, $zero,6
	beq $t0,$v0,ExibirRankingPorDespesas #caso t0 e v0 sejam iguais da um jump

	addi $t0, $zero,7
	beq $t0,$v0,Sair #caso t0 e v0 sejam iguais da um jump
#------------------------------------------------------------------------------------------------------
# dentro dos labels so tem uma funcao teste para saber se entro no label certo
RegistrarDespesas:
#----------Recebe dia-------------
	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg2  #Passa a msg para o parametro a0
	syscall

	addi $v0, $zero, 0

	li $v0, 5
	syscall
  move $s2, $v0

	la $t2, array1

	sh $s2, 0($t2)
  lh $s3, 0($t2)

  li $v0, 1
	add $a0, $zero, $s3
	syscall
#-------Recebe mes------------
	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg3  #Passa a msg para o parametro a0
	syscall

	addi $v0, $zero, 0

	li $v0, 5
	syscall
	move $s2, $v0

	la $t2, array1

	sh $s2, 2($t2)
	lh $s3, 2($t2)
	lh $s4, 0($t2)

	li $v0, 1
	add $a0, $zero, $s4
	syscall

	li $v0, 1
	add $a0, $zero, $s3
	syscall
#--------Recebe ano---------------
	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg4  #Passa a msg para o parametro a0
	syscall

	addi $v0, $zero, 0

	li $v0, 5
	syscall
	move $s2, $v0

	la $t2, array1

	sh $s2, 4($t2)
	lh $s5, 4($t2)
	lh $s4, 0($t2)
	lh $s3, 2($t2)

	li $v0, 1
	add $a0, $zero, $s4
	syscall

	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg9  #Passa a msg para o parametro a0
	syscall

	li $v0, 1
	add $a0, $zero, $s3
	syscall

	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg9  #Passa a msg para o parametro a0
	syscall

	li $v0, 1
	add $a0, $zero, $s5
	syscall

	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg5  #Passa a msg para o parametro a0
	syscall

	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg6  #Passa a msg para o parametro a0
	syscall

	li $v0, 6
	syscall
  move $s2, $v0

	sh $s2, 6($t2)
	lh $s5, 6($t2)

	li $v0, 2
	add $a0, $zero, $s5
	syscall

	li $v0, 4     # Codigo SysCall p/ escrever strings
	la $a0, msg10  #Passa a msg para o parametro a0
	syscall

	j main # retorna para a main
ExcluirDespesas:
	add $t0, $zero,$v0
	li $v0, 1
	add $a0, $zero, 2
	syscall
	j main # retorna para a main
ListarDespesas:
	add $t0, $zero,$v0
	li $v0, 1
	addi $a0, $zero, 3
	syscall
	j main # retorna para a main
ExibirGastoMensal:
	add $t0, $zero,$v0
	li $v0, 1
	addi $a0, $zero, 4
	syscall
	j main # retorna para a main
ExibirgastosPorCategoria:
	add $t0, $zero,$v0
	li $v0, 1
	addi $a0, $zero, 5
	syscall
	j main # retorna para a main
ExibirRankingPorDespesas:
	add $t0, $zero,$v0
	li $v0, 1
	addi $a0, $zero, 6
	syscall
	j main # retorna para a main
Sair:
	li $v0, 10 # comando de exit, nao sei se vamos usar mais por via das duvidas deixei comentado
	syscall

#---------------STRCMP------------------------------------------------------------------------------
STRCMP: #$a0 String 1, $a1 String 2, $v0 = 0 se igual, $v0 = 1 se diferente
    add $t0, $zero, $zero # i = 0
STRCMPL1:
    add $t1, $a0, $t0 # $t1 = &str1[i]
    lbu $t1, 0($t1) # $t1 = str1[i]
    add $t2, $a1, $t0 # $t2 = &str2[i]
    lbu $t2, 0($t2) # $t2 = str2[i]
    beq $t1, $t2, STRCMP_L2 # se for igual entre si
    addi $v0, $zero, 1
    j STRCMP_FIM
STRCMP_L2:
    addi $t0, $t0, 1
    bne $t1, $zero, STRCMPL1 # se nao for \0 volta com i++
    add $v0, $zero, $zero
STRCMP_FIM:
    jr $ra
