import TimeIt
import WeightedGraph(ark)
import BellmanFord(bellmanFord)
import Kruskals(kruskals)

menuGrafo = do
  putStrLn "\nGrafos\n\n"
  putStrLn "(1) Bellman Ford\n(2)Kruskal's"
  opcao <- getLine
  case opcao of
    "1" -> timeIt $ putStrLn ("Result: " ++ show (bellmanFord ark "Clinton"))
    "2" -> timeIt $ putStrLn ("Result: " ++ show (kruskals ark)) 

main = do
  putStrLn "\n\nSelecione o módulo desejado:"
  putStrLn "(1) Grafos"
  opcao <- getLine
  case opcao of
    "1" -> menuGrafo
