.data

matriz: .space 400 # declara��o de 200 bytes para armazenar uma matriz de 10x10 de inteiros
vetor: .space 40
vetor_aux: .space 40

.text

inicio: la $t0, matriz # carrega oendere�o base do array em $t0
la $t1, vetor

li $t3, 15 # def    [0] elemento
sw $t3, 0($t1) # carrega o elemento no vetor
li $t3, 2 # def    [1] elemento
sw $t3, 4($t1) # carrega o elemento no vetor
li $t3, 29 # def   [2] elemento
sw $t3, 8($t1) # carrega o elemento no vetor
li $t3, 97 # def   [3] elemento
sw $t3, 12($t1) # carrega o elemento no vetor
li $t3, 3 # def    [4] elemento 
sw $t3, 16($t1) # carrega o elemento no vetor
li $t3, 34 # def   [5] elemento
sw $t3, 20($t1) # carrega o elemento no vetor 
li $t3, 49 # def   [6] elemento
sw $t3, 24($t1) # carrega o elemento no vetor
li $t3, 77 # def   [7] elemento
sw $t3, 28($t1) # carrega o elemento no vetor
li $t3, 81 # def   [8] elemento
sw $t3, 32($t1) # carrega o elemento no vetor
li $t3, 99 # def   [9] elemento
sw $t3, 36($t1) # carrega o elemento no vetor

add $t3, $zero, $zero # zera o reg T3

loop_principal: bgt $t3, 9, ordena_linhas_mat # loop para percorrer o vetor USANDO $T3
add $t4 ,$t3, $t3
add $t4, $t4, $t4 # calculando o offset do vetor colocado em $t4
add $t4, $t4, $t1 # endere�o de A[i]
lw $t5, 0($t4) # carrega em T5 A[i]
add $t4, $zero, $zero # zera o registrador T4 ap�s o uso
addi $t3, $t3, 1 # incrementando a vari�vel do la�o
j func_bucket_sort

# registradores T0 T1 T3 e T5 n�o pode ser alterado n�o posem ser sobrescritos nessa fun��o
func_bucket_sort:
# pular para func_inserir_mat com a linha na qual o n�meor deve ser inserido

func_inserir_mat:
# utiliza o n�mero calculado na fun��o bucket_sort para sobrescrever o primeiro diferente de zero na linha onde deve ser inserido
# pular para o loop principal novamente

ordena_linhas_mat:
# fun��o que ordena todas as linhas da matriz
# pula para percorrer_mat

percorrer_mat:
# fun��o que instancia o vetor auxiliar em um vari�vel
# percorre a matriz adicionando todos os elementos diferentes de 0 no vetor
