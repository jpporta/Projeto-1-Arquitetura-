meses: .space 48

msgMesAno: .asciiz "\n\nAno a ser verificado?\n"
msgMes0: .asciiz "\n\nJaneiro"
msgMes1: .asciiz "\n\nFevereiro"
msgMes2: .asciiz "\n\nMarco"
msgMes3: .asciiz "\n\nAbril"
msgMes4: .asciiz "\n\nMaio"
msgMes5: .asciiz "\n\nJunho"
msgMes6: .asciiz "\n\nJulho"
msgMes7: .asciiz "\n\nAgosto"
msgMes8: .asciiz "\n\nSetembro"
msgMes9: .asciiz "\n\nOutubro"
msgMes10: .asciiz "\n\nNovembro"
msgMes11: .asciiz "\n\nDezembro"
msgMesVal: .asciiz "\nValor: R$ "
    
    ##########################################
	#LISTAGEM DE DESPESAS POR Mes
	##########################################
ExibirGastoMensal:

	la $s2, array1 #Load addres do vetor
	addi $s2, $s2, -32

	li $v0, 4 
	la $a0, msgMesAno
	syscall

	li $v0, 5	 # Codigo SysCall p/ ler inteiros
	syscall
	add $a0, $zero, $v0

LoopDespesasMes:
	addi $s2, $s2, 32
	#condicao de parada
	lh $t0, 0($s2)
	beq $t0, $zero, EndLoopDespesaMes
	#else
	addi $s2, $s2, 6 # posicao do ano
	lh $t0, 0($s2)
	addi $s2, $s2, -6 #pos inicial
	bne $t0, $a0, LoopDespesasMes

	addi $s2, $s2, 4
	lh $t0, 0($s2) #recebe o mes
	addi $s2, $s2, -4

	addi $t0, $t0, -1
	#Loop para encontrar a posicao certa do vetor meses
	la $s1, meses
LoopRegistrarDespesaMes:
	beq $t0, $zero, FimLoopRegistrarDespesas #condicao de parada
	addi $s1, $s1, 4
	addi $t0, $t0, -1
	j LoopRegistrarDespesaMes
FimLoopRegistrarDespesas:

	# mes encontrado
	addi $s2, $s2, 12
	l.s $f0, 0($s2) #valor da despesa
	addi $s2, $s2, -12

	l.s $f1, 0($s1) #valor da soma do mes

	add.s $f0, $f0, $f1 # f0 = despesa + soma das despesas anteriores

	s.s $f0, 0($s1)

	j LoopDespesasMes
EndLoopDespesaMes:

#Listagem das Despesas

	la $s1, meses

	#janeiro
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes0
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#fevereiro
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes1
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#marco
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes2
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#abril
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes3
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#maio
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes4
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#junho
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes5
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#julho
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes6
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#agosto
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes7
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#setembro
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes8
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#outubro
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes9
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#novembro
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes10
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	#dezembro
	addi $s1, $s1, 4
	l.s $f12, 0($s1)

	addi $v0, $zero, 4
	la $a0, msgMes11
	syscall

	addi $v0, $zero, 4
	la $a0, msgMesVal
	syscall

	addi $v0, $zero, 2
	syscall

	addi $v0, $zero, 4
	la $a0, msg10
	syscall

	#limpar vetor meses
	addi $t1, $zero, 12
	la $s1, meses
	sub.s $f3, $f3, $f3
LoopZerarVetor:
	beq $t1, $zero, FimLoopZeraVetor
	s.s $f3, 0($s1)
	addi $s1, $s1, 4
	addi $t1, $t1, -1
	j LoopZerarVetor
FimLoopZeraVetor:

j main