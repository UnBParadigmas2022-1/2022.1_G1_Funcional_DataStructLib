import TimeIt
import WeightedGraph(ark)
import BellmanFord(bellmanFord)
import Kruskals(kruskals)
<<<<<<< HEAD
<<<<<<< HEAD
import BFS_DFS (bfs, dfs, g)
=======
import BinaryTree (valuesPostOrder, insertElement, treexample)
>>>>>>> d12c7ce... Adicionando execução de insert e postOrder à main
=======
import BFS_DFS (bfs, dfs, g)
import BinaryTree (valuesPostOrder, insertElement, treexample)
>>>>>>> 878e45c0a724a69e8f1031a4b311d3f0f4b3dbc2

menuGrafo = do
  putStrLn "Algoritmos:"
  putStrLn "(1) Bellman Ford\n(2) Krusal's\n(3) Busca em Largura (BFS)\n(4) Busca em Profundidade (DFS)"
  putStr "Selecione um algoritmo: "
  opcao <- getLine
  case opcao of
    "1" -> timeIt $ putStrLn ("Result: " ++ show (bellmanFord ark "Clinton"))
<<<<<<< HEAD
<<<<<<< HEAD
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals ark)) 
    "3" -> timeIt $ putStrLn ("Result: " ++ show (bfs g [] ["Marshall"])) 
    "4" -> timeIt $ putStrLn ("Result: " ++ show (dfs g "Marshall")) 
=======
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals ark))
    "3" -> timeIt $ putStrLn ("Result: " ++ show (bfs g [] ["Clinton"]))
    "4" -> timeIt $ putStrLn ("Result: " ++ show (dfs g "Clinton"))
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 3ede0f1... correção de conflito
=======
>>>>>>> fdf7fa8... correção de conflito
=======
>>>>>>> c838df3... correção de conflito
=======
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals ark))
    "3" -> timeIt $ putStrLn ("Result: " ++ show (bfs g [] ["Clinton"]))
    "4" -> timeIt $ putStrLn ("Result: " ++ show (dfs g "Clinton"))
>>>>>>> 878e45c0a724a69e8f1031a4b311d3f0f4b3dbc2

main = do
  putStrLn "Módulos:"
  putStrLn "(1) Grafos"
<<<<<<< HEAD
<<<<<<< HEAD
  putStr "Selecione o módulo desejado: "
=======
  putStrLn "(2) Árvore Binária"
>>>>>>> d12c7ce... Adicionando execução de insert e postOrder à main
=======
  putStrLn "(2) Árvore Binária"
  putStr "Selecione o módulo desejado: "
>>>>>>> 878e45c0a724a69e8f1031a4b311d3f0f4b3dbc2
  opcao <- getLine
  case opcao of
    "1" -> menuGrafo
    "2" -> timeIt $ putStrLn ("Result: " ++ show (valuesPostOrder (insertElement treexample 5)))
