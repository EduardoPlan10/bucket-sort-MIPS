.data

matriz: .space 400 # declaraÃ§Ã£o de 200 bytes para armazenar uma matriz de 10x10 de inteiros
vetor: .space 40
vetor_aux: .space 40
vetor_aux2: .space 40

.text

inicio: la $t0, matriz # carrega oendereÃ§o base do array em $t0
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

loop_principal: bgt $t3, 9, ordena_linhas_mat_def_var # loop para percorrer o vetor USANDO $T3
add $t4 ,$t3, $t3
add $t4, $t4, $t4 # calculando o offset do vetor colocado em $t4
add $t4, $t4, $t1 # endereÃ§o de A[i]
lw $t5, 0($t4) # carrega em T5 A[i]
add $t4, $zero, $zero # zera o registrador T4 apÃ³s o uso
addi $t3, $t3, 1 # incrementando a variÃ¡vel do laÃ§o
j func_bucket_sort

# registradores T0 T1 T3 e T5 nÃ£o pode ser alterado nÃ£o posem ser sobrescritos nessa funÃ§Ã£o T5 carrega inteiro da posiÃ§Ã£o A[i] do vetor
func_bucket_sort: 
li $t7, 10   
li $t8, 100 #definindo parametros para o calculo do bucket
mult $t5, $t7
mflo $t9
div $t9, $t8
mflo $t9     # pegando a parte inteira (N*10/100)
add $t7, $zero, $zero
add $t8, $zero, $zero
# pular para func_inserir_mat com a linha na qual o nÃºmeor deve ser inserido

#t9 guarda o resto da divisÃ£o (linha onde o elemento T5 deve ser inserido
func_inserir_mat: li $t7, 40
mult $t9, $t7
mflo $t8
add $t8, $t8, $t0 #offset da linha calculado
lw $t2, 0($t8)
func_inserir_mat_insira_loop: beqz $t2, func_inserir_mat_insira
addi $t8,$t8, 4
lw $t2, 0($t8)
j func_inserir_mat_insira_loop

# utiliza o nÃºmero calculado na funÃ§Ã£o bucket_sort para sobrescrever o primeiro diferente de zero na linha onde deve ser inserido


func_inserir_mat_insira: sw $t5, ($t8)
j loop_principal
#apenas sobresvereva a posiÃ§Ã£o da matriz com o valor em T5
# pular para o loop principal novamente

#apenas T0 T1 e T2 não podem ser usados
ordena_linhas_mat_def_var: li $t3, 40
li $t4, 0
li $t7, 0
li $t8, 9
ordena_linhas_mat_main: mult $t4, $t3
mflo $t5
add $t5, $t5, $t0
lw $t6, $t5
bnez $t6, ordena_linhas_mat_percorre_linha
addi $t4, $t4, 1
j ordena_linhas_mat_main

ordena_linhas_mat_percorre_linha:
la $t9, vet_aux2
bne $t7, 
addi $t4, $t4, 1
#######################################################################################################################################
#Func_ord

#	fluxo 1- {Contar elementos diferentes de 0 nas i linhas 
#			 {Armazenar em vetor_aux2 os elementos contidos na linha i
#			 {Ordenar vetor_aux2

#	fluxo 2- {Inseirr em vetor_aux os elementos de vetor_aux2 nas posições diferentes de 0
