vetorCat: .space 200 #sendo no maximo 10 categorias


##########################################
# ORGANIZAR DESPESA POR CATEGORIA
##########################################
# $s0 contem endereco do vetor principal
# $s1-4 contem a string categoria
# $f0 contem o valor da despesa atual
# entrar na funçao com jal
InserirDespesas:

	# salvando endereco de retorno
	sw  $ra, 0($sp)
	addi $sp, $sp, 4

    # limpeza do vetor, se houversse algo dentro seria duplicado
    addi $t0, $t0, 201
    la $t1, vetorCat
limpezaVetorDespeza:
    addi $t0, $t0, -1
    beq $t0, $zero, FimLimpezaVetorDespeza
    sb $zero, 0($t1)
    addi $t1, $t1, 1
    j limpezaVetorDespeza
FimLimpezaVetorDespeza:

    la $s0, arra1 #carrega o endereço array principal

AdicionaDespesasVetorCar:
    # condição de parada
    lh $t0, 0($s0)
    beq $t0, $zero, FimAdicionaDespesaVetorCar

    #recebe valor despesa
    addi $s0, $s0, 12
    l.s $f0, 0($s0)
    #recebe a categoria
    addi $s0, $s0, 4
    lw $s1, 0($s0)
    addi $s0, $s0, 4
    lw $s2, 0($s0)
    addi $s0, $s0, 4
    lw $s3, 0($s0)
    addi $s0, $s0, 4
    lw $s4, 0($s0)

    # coloca a proxima despesa em s0
    addi $s0, $s0, 4

    jal insereDespesaVetor
    j AdicionaDespesasVetorCar
FimAdicionaDespesaVetorCar:
    addi $sp, $sp, -4
    lw $ra, 0($sp)
    jr $ra

# Inserir valores no vetor de categorias
insereDespesaVetor:
    #vetor categoria
    la $s5, vetorCat
    addi $s5, $s5, -20 # Para facilitar o Loop
    addi $s6, $zero, 11 # contador/limite de categorias

SegueListaCategoria:
    addi $s5, $s5, 20
    addi $s6, $s6, -1 #count--

    #condicao de parada
    beq $s6, $zero, FimInsereDespesaVetor
    #carregando a string do vetor
    lw $t0, 0($s5)
    lw $t1, 4($s5) # DUVIDA
    lw $t2, 8($s5)
    lw $t3, 16($s5)

    beq $t0, $zero, insereDespesaVetorSemComparacao # se vazio insiro uma nova
    #coparacao para ver se é igual
    and $t0, $t0, $s0 # se igual, t = -1
    and $t1, $t1, $s1 # se igual, t = -1
    and $t2, $t2, $s2 # se igual, t = -1
    and $t3, $t3, $s3 # se igual, t = -1

    sub $t0, $t0, $t1 # se igual, t = 0
    sub $t2, $t2, $t3 # se igual, t = 0

    add $t0, $t0, $t2 # se as duas strings iguais, $t0 = 0

    bne $t0, $zero, SegueListaCategoria # não é igual, e não vazio, não insere
    j comparacaoCorretaCategoria

    # so entro aqui se o vetor de comparado esta vazio, portanto devo inserir uma nova categoria
insereDespesaVetorSemComparacao:
    sw $t0, 0($s5)
    sw $t1, 4($s5) # DUVIDA
    sw $t2, 8($s5)
    sw $t3, 16($s5)

# coparacao correta ou nova categoria
comparacaoCorretaCategoria:
    addi $s5, $s5, 16 # encontro o gasto

    # somo o gasto já registrado, e retorno para o vetor
    l.s $f1, 0($s5)
    add.s $f0, $f0, $f1
    s.s $f0, 0($s5)

FimInsereDespesaVetor:
    jr $ra
