import TimeIt
import TesteSort(doMergeSorts, doQuicksort, doInsertion, doSelectionSort, doBubbleSort, allSort ) 
import WeightedGraph(ark, big)
import BellmanFord(bellmanFord)
import Kruskals(kruskals)
import BFS_DFS(bfs, dfs, g)
import BinaryTree (valuesPostOrder, insertElement, treexample)
import TestePilha(testePilha)
import Teste


menuGrafo = do
  putStrLn "Algoritmos:"
  putStrLn "(1) Bellman Ford\n(2) Krusal's\n(3) Busca em Largura (BFS)\n(4) Busca em Profundidade (DFS)"
  putStr "Selecione um algoritmo: "
  opcao <- getLine
  case opcao of
    "1" -> timeIt $ putStrLn ("Result: " ++ show (bellmanFord big "1"))
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals big)) 
    "3" -> timeIt $ putStrLn ("Result: " ++ show (bfs g [] ["Marshall"])) 
    "4" -> timeIt $ putStrLn ("Result: " ++ show (dfs g "Marshall")) 

menuSort = do   
    putStrLn "Módulos:"
    putStrLn "(1) Merge Sorts"
    putStrLn "(2) Quicksort"
    putStrLn "(3) Insertion"
    putStrLn "(4) SelectionSort"
    putStrLn "(5) BubbleSort"
    putStrLn "(6) All"
    putStr "Selecione o módulo desejado: "
    opcao <- getLine
    case opcao of
        "1" -> timeIt $doMergeSorts
        "2" -> timeIt $doQuicksort
        "3" -> timeIt $doInsertion
        "4" -> timeIt $doSelectionSort
        "5" -> timeIt $doBubbleSort
        "6" -> timeIt $allSort

main = do
  putStrLn "Módulos:"
  putStrLn "(1) Grafos"
  putStrLn "(2) Árvore Binária"
  putStrLn "(3) Pilha"
  putStrLn "(4) Merge Sort"
  putStrLn "(5) Algoritimos de Ordenação"
  putStr "Selecione o módulo desejado: "
  opcao <- getLine
  case opcao of
    "1" -> menuGrafo
    "2" -> timeIt $ putStrLn ("Result: " ++ show (valuesPostOrder (insertElement treexample 5)))
    "3" -> timeIt $ testePilha
    "4" -> timeIt $ doMergeSort
    "5" -> menuSort
