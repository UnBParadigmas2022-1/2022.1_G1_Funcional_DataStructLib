# Biblioteca de Estruturas de Dados (Haskell)

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 01<br>
**Paradigma**: Funcional<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 18/0013637 | Arthur Paiva Tavares |
| 18/0117548 | Bruno Carmo Nunes |
| 16/0028361 | Gabriel Batista Albino Silva |
| 14/0156909 | Nathalia Lorena Cardoso Dias |
| 17/0051277 | Nicolas Georgeos Mantzos |
| 17/0114333 | Sofia Costa Patrocinio |
| 19/0048760 | Wellington Jonathan de Souza Rodrigues |
## Sobre 
O objetivo é construir uma biblioteca que agrege as principais estruturas de dados acompanhadas de seus algoritmos
principais para as operações de inserção, ordenação, deleção e busca implementados no paradigma funcional. 

Ao final do semestre, os repositórios nos diversos paradigmas serão unificados para a construção de uma biblioteca que documente a performance
dessas operações.

## Screenshots
Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: xxxxxx<br>
Descreva os pré-requisitos para rodar o seu projeto e os comandos necessários.
Insira um manual ou um script para auxiliar ainda mais.
Gifs animados e outras ilustrações são bem-vindos!

## Uso 

## Haskell

Inicialmente é necessario que  instale a plataforma do Haskell. Se você estiver no linux baseado no Debian, basta copiar a seguinte linha no seu terminal:
```
$ sudo apt-get install haskell-platform
```

Clone este repositório:

```
$ git clone <https://github.com/UnBParadigmas2022-1/2022.1_G1_Funcional_DataStructLib.git>
```

Abra o **GHCI**, que é o modo interativo do Haskell dentro da pasta do Projeto

```
$ ghci
```

você poderá carregar as funções digitando ```:l Main.hs```,  dentro do pasta do projeto.

# Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
A tabela abaixo sintetiza, nas palavras do contribuidor, as contribuições acompanhadas de sua respectiva significância.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | ---- | - |
| Arthur Paiva Tavares  | Adição do Módulo de Árvore binária com inserção, travessia em Pré-Ordem, Em-Ordem e Pós-Ordem e a implementação da função fmap com Functors | - |
| Bruno Carmo Nunes  | Adição do algoritmo de ordenação MergeSort, juntamente com o teste com 10000 e 100000 números randômicos e também repetidos. | - |
| Gabriel Batista Albino Silva | Adição dos algorítmos de Kruskal's para criação de Arvores Geradoras Mínimas e Bellman Ford para encontrar distâncias a partir de um ponto, incluíndo implementação do método de detecção de ciclos "Union-Find". | Excelente |
| Nathalia Lorena Cardoso Dias  | Adição do Módulo de Pilha, com inserção de novo elemento, remoção, verificação de pilha vazia e verificação do elemento topo da pilha | - |
| Nicolas Georgeos Mantzos  | Adição dos algoritmos para Busca em Profundidade, Busca em Largura e avaliação geral dos grafos (possui caminhos, possui passeios, possui trilhas, representa um ciclo, natureza dos caminhos etc) | - |
| Sofia Costa Patrocinio  | - | - |
| Wellington Jonathan de Souza Rodrigues  | - | - |

## Percepções gerais, lições aprendidas, fragilidades superadas...
A tabela abaixo compila as percepções e lições aprendidas por cada participante no desenvolvimento do primeiro módulo do projeto.

|Nome do Membro | Comentário | 
| -- | ---- |
| Arthur Paiva Tavares  | A implementação das funções mais comuns para travessia em Árvore binária não foram tão complexas graças à forma que o paradigma funcional conversa com funções recursivas, as maiores dificuldades foram em relação à sintaxe e à correção de erros que pareciam não fazer sentido de primeira, o conhecimento teórico do funcionamento da linguagem foi mais necessário do que em linguagens com sintaxe mais convencional e erros mais genéricos comuns de outros paradigmas. A implementação de Functor foi algo que lembrou o uso de interfaces em GoLang, mesmo que com integração, sintaxe e funcionamentos diferentes |
| Bruno Carmo Nunes  | Considerei bem complicado tentar reimplementar o mergeSort, apesar de ele já haver uma recursão no paradigma estrutural, a dificuldade ocorreu justamente na falta de um laço e também nessa ideia de tipificação dos dados. Apesar de a ideia ser tranquila, onde é justamente dividir e conquistar, acabei me enrolando justamente na parte de dividir em pequenos pedaços e juntá-los tudo em uma só lista. <br> O maior problema foi realmente fazer essa solução como tudo sendo recursivo. Tive que procurar algumas ajudas na internet, como fazer essas quebras de cada uma das listas, onde achei o recurso para usar o fst e o snd, que são para pegar a primeira e a segunda variável dentro das tuplas. <br> No fim, apesar das raivas que passei, gostei de implementar esse paradigma. Creio que o maior problema deve ser na prática do mesmo. | 
| Gabriel Batista Albino Silva  | Achei o paradigma funcional complicado para lidar com a recursão de algorítmos complexos de grafos como o Bellman-Ford e o de Kruskal's, uma vez que ambos dependem de iterações anteriores e estrutura de dados auxiliares para seu amplo funcionamento. Sinto que poderia ter feito um trabalho melhor na tradução dos algorítmos para o modo recursivo aproveitando mais o _sugar syntax_ do haskell, porém me senti bastante satisfeito ao implementar uma versão funcional dos algorítimos citados acima. |
| Nathalia Lorena Cardoso Dias  | Senti dificuldades em a assimilar a sintaxe e estruturação de funções em Haskell, pois me lembram mais uma notação matemática do que uma linguagem de programação. Tive dificuldades na assimilação do paradigma funcional como um todo, por isso, optei por iniciar minha contribuição com uma estrutura de dados mais simples.|
| Nicolas Georgeos Mantzos  | Tive dificuldade de formular soluções recursivas para os problemas com os quais trabalhava iterativamente nos paradigmas estruturado e orientado a objetos. Sem falar, claro, no quanto a sintaxe do Haskell me pareceu áspera e árida na escrita das primeiras linhas e como a importação do que conhecia de outros carnavais muitas vezes mais atrapalhou do que ajudou. Conceitos como "Classes de Tipo", por exemplo,  se alinham mais com a ideia de Interface das liguagens orientadas a objetos do que propriamente com classes. <br> <br>Tentarei chegar mais como uma folha em branco nos próximos paradigmas. <br> <br> Por outro lado, pude afinar minha atrofiada "visão recursiva" ao modelar a solução para os problemas. "Humm...será que consigo quebrar isso em pequenas partes?"   |
| Sofia Costa Patrocinio  | - | - |
| Wellington Jonathan de Souza Rodrigues  | - |


## Fontes

> - Rosen, Kenneth. **Matemática Discreta e Suas Aplicações**. 06. ed. São Paulo: Mc Graw Hill, 2009.

> - Khatri Lamba, Jayanti. BFS and DFS Graph Traversals | Breadth First Search and Depth First Search | Data structures. Youtube, 25 jan. 2019. Disponível em: <https://www.youtube.com/watch?v=vf-cxgUXcMk>. Acesso em 01 jul. 2022.

> - Assignment 3: Shortest paths in Haskell, 2014. Disponível em: http://www.cburch.com/cs/360/assn/03/index.html (Utilizado apenas a estrutura de grafos bidirecionais com pesos em Haskell)

> - CalculateTime.hs. Disponível em https://github.com/UnBParadigmas2020-2/2020.2_G4_Funcional_SortBenchmark/blob/master/app/CalculateTime.hs

> - Exploring Binary Trees (Part 1) - Haskell.
 Youtube, 08 mai. 2019. Disponível em: <https://www.youtube.com/watch?v=2cBeXpQcB_o>. Acesso em 03 jul. 2022.

> - Exploring Binary Trees (Part 2) - Haskell. Youtube, 08 mai. 2019. Disponível em: <https://www.youtube.com/watch?v=a-nMwpMzZP8>. Acesso em 03 jul. 2022.

> - Merge Sort - Wikipedia. Disponível em : <https://pt.wikipedia.org/wiki/Merge_sort>. Acesso em 04/07/2022.

> - Implement Stack using Queues. Disponível em: <https://www.geeksforgeeks.org/implement-stack-using-queue/>. Acesso em 02 de Julho. 2022.

> - Curso de Haskell - Aula 28 - Tipos Algébricos. Youtube, 05 fev. 2014. Disponível em: <https://www.youtube.com/watch?v=oXLln91ch1Y>. Acesso em 03 jul. 2022.
> - Algoritimos de ordenação. Disponível em https://github.com/anabxms/algoritmos-ordenacao
