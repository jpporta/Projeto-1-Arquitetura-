.data
msg0: .asciiz "\tControle de Gastos\n"
msg1: .ascii "\t\t1) Registrar Despesas\n\t\t2) Excluir Despesas\n\t\t3) Listar Despesas\n\t\t4) Exibir Gasto Mensal\n\t\t"
msg11:.asciiz"5) Exibir gastos por Categoria\n\t\t6) Exibir Ranking por Despesas\n\t\t7) Sair\n\n"

msg3:
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
	beq $t0,$v0,RegistrarDespesas
	
	addi $t0, $zero,2
	beq $t0,$v0,ExcluirDespesas
	
	addi $t0, $zero,3
	beq $t0,$v0,ListarDespesas
	
	addi $t0, $zero,4
	beq $t0,$v0,ExibirGastoMensal
	
	addi $t0, $zero,5
	beq $t0,$v0,ExibirgastosPorCategoria
	
	addi $t0, $zero,6
	beq $t0,$v0,ExibirRankingPorDespesas
	
	addi $t0, $zero,7
	beq $t0,$v0,ExibirRankingPorDespesas
#------------------------------------------------------------------------------------------------------	
# dentro dos labels so tem uma funcao teste para saber se entro no label certo	
RegistrarDespesas:
	add $t0, $zero,$v0
	li $v0, 1
	add $a0, $zero, 1		
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
	