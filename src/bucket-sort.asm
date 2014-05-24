.data

matriz: .space 400 # declaração de 200 bytes para armazenar uma matriz de 10x10 de inteiros
vetor: .space 40

.text

inicio: la $t0, matriz # carrega oendereço base do array em $t0
la $t1, vetor
li $t2, 4
li $t3, 15 # def    [0] elemento
sw $t3, ($t1)
li $t3, 2 # def    [1] elemento
sw $t3, 4($t1)
li $t3, 29 # def   [2] elemento
sw $t3, 8($t1)
li $t3, 97 # def   [3] elemento
sw $t3, 12($t1)
li $t3, 3 # def    [4] elemento
sw $t3, 16($t1)
li $t3, 34 # def   [5] elemento
sw $t3, 20($t1)
li $t3, 49 # def   [6] elemento
sw $t3, 24($t1)
li $t3, 77 # def   [7] elemento
sw $t3, 28($t1)
li $t3, 81 # def   [8] elemento
sw $t3, 32($t1)
li $t3, 81 # def   [9] elemento
sw $t3, 36($t1)