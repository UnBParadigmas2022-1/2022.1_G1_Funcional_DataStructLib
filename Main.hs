import TimeIt
import WeightedGraph(ark)
import BellmanFord(bellmanFord)
import Kruskals(kruskals)
import BFS_DFS (bfs, dfs, g)

menuGrafo = do
  putStrLn "Algoritmos:"
  putStrLn "(1) Bellman Ford\n(2) Kruskal's\n(3) Busca em Largura (BFS)\n(4) Busca em Profundidade (DFS)"
  putStr "Selecione um algoritmo: "
  opcao <- getLine
  case opcao of
    "1" -> timeIt $ putStrLn ("Result: " ++ show (bellmanFord ark "Clinton"))
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals ark)) 
    "3" -> timeIt $ putStrLn ("Result: " ++ show (bfs g [] ["Marshall"])) 
    "4" -> timeIt $ putStrLn ("Result: " ++ show (dfs g "Marshall")) 

main = do
  putStrLn "Modulos:"
  putStrLn "(1) Grafos"
  putStr "Selecione o módulo desejado: "
  opcao <- getLine
  case opcao of
    "1" -> menuGrafo
