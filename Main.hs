import TimeIt
import WeightedGraph(ark)
import BellmanFord(bellmanFord)
import Kruskals(kruskals)
<<<<<<< HEAD
import BFS_DFS (bfs, dfs, g)
=======
import BinaryTree (valuesPostOrder, insertElement, treexample)
>>>>>>> d12c7ce... Adicionando execução de insert e postOrder à main

menuGrafo = do
  putStrLn "Algoritmos:"
  putStrLn "(1) Bellman Ford\n(2) Krusal's\n(3) Busca em Largura (BFS)\n(4) Busca em Profundidade (DFS)"
  putStr "Selecione um algoritmo: "
  opcao <- getLine
  case opcao of
    "1" -> timeIt $ putStrLn ("Result: " ++ show (bellmanFord ark "Clinton"))
<<<<<<< HEAD
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals ark)) 
    "3" -> timeIt $ putStrLn ("Result: " ++ show (bfs g [] ["Marshall"])) 
    "4" -> timeIt $ putStrLn ("Result: " ++ show (dfs g "Marshall")) 
=======
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals ark))
    "3" -> timeIt $ putStrLn ("Result: " ++ show (bfs g [] ["Clinton"]))
    "4" -> timeIt $ putStrLn ("Result: " ++ show (dfs g "Clinton"))
>>>>>>> 3ede0f1... correção de conflito

main = do
  putStrLn "Módulos:"
  putStrLn "(1) Grafos"
<<<<<<< HEAD
  putStr "Selecione o módulo desejado: "
=======
  putStrLn "(2) Árvore Binária"
>>>>>>> d12c7ce... Adicionando execução de insert e postOrder à main
  opcao <- getLine
  case opcao of
    "1" -> menuGrafo
    "2" -> timeIt $ putStrLn ("Result: " ++ show (valuesPostOrder (insertElement treexample 5)))
