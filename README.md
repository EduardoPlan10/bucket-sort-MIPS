bucket-sort-MIPS
================

Projeto Bucket-sort em mips | UFRN arquitetura de computadores


Segue a descrição do funcionamento e das funcionalidades do bucket-sort

Adota-se para esse algorimo em específico um caracter de escape 0. Toda operação envolvendo inserção busca da matriz deve ignorar valores 0.

É aceitável como entrada desse programa apenas vetores de 10 posições com números em um intervalo de 1~99.

Utilizaremos uma abstração da idéia de matrizes, como precisariamos para o algoritmo uma matriz 10x10 teremos um vetor de 100 posições que será acessado através da indexação i e j.

Para o bucket sort em assembly precisamos de:

1- Uma função cria_vetor que inicializa em memória um vetor de 100 posições preenchido com um caractere de escape qualquer, caracter de escape é o que indica que aquela posição ainda não foi preenchida o equivalente em uma linguagem de alto nível do tipo NONE ou NULL do C.

2- Uma função que acesse esse vetor abstraindo o vetor como uma ideia de matriz indexada em i,j, Exemplo:

vetor = [1,2,3,4,5,6,7,8,9] 

seria o equivalente a uma matriz 3x3 

mat = [1,2,3]
      [4,5,6]
      [7,8,9]

Isso se dá por que em assembly não temos uma estrutura primitiva que seja uma matriz, então abistraimos a idéia para um vetor sendo assim a função de acesso ao passarmor para ela 2,3 deve retornar a posição na memória do valor 9 *Considerando a indexação em 0

acessar_mat(2,3) -> 9

Para isso consideramos o calculo do offset sempre que tivermos um indice do tipo i (linha) esse indice i será multiplicado por 40 para acessar a linha desejada, pois caso tivesse mos um vetor que começa na posição 0x00 para acessarmos o equivalente a linha 1 do vetor (considerando a indexação em 0) precisariamos somar (4 * número da linha * número de colunas + 4 * número da coluna) assim a posição 1,0 da matriz seria acesada somando 40 a 0x00. 

Outro exemplo: para acessarmos a posição 2,2 de uma matriz 10*10 precisariamos adicionar a posição de memória no início do vetor

4 * 2 * 10 + 4*2 = 88

Então no endereço de mamória 0x00 + 88 estaria o elemento desejado.



3- Uma função chamada bucket_sort que retornará em qual linha da matriz aquele elemento deve ser inserido. Onde para número maiores que 10 teríamos a parte inteira de: (N * 10/100) e para números menores que 10 teríamos o resto da divisão supracitada


4- Uma função para percorrer a linha da matriz até encontrar um caracter de escape e sobreescrever o carcter de escape com o valor desejado inserir_mat


5- Um função para ordenar a linha da matriz, como se fosse um subvetor, pode-se usar o bubble-sort para isso ordena_linha

No main teremos apenas um laço que percorre o vetor e chama para aquele valor bucket_sort depois inserir_mat depois de inserir todos os valores na matriz chama-se ordena_linha para todas as linhas que possuem valores não nulos, depois desses processos basta percorrer a matriz e inserir os valores em um novo vetor, este vetor estará ordenado.
