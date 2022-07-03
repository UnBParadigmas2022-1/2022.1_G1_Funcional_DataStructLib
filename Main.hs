import CalculateTime(benchmarkForAllArrays)
import WeightedGraph(ark)
import BellmanFord(bellmanFord)
import Kruskals(kruskals)

menuGrafo = do
  putStrLn "\nGrafos\n\n"
  putStrLn "(1) Bellman Ford\n(2)Kruskal's"
  opcao <- getLine
  case opcao of
    "1" -> benchmarkForAllArrays bellmanFord ark
    "2" -> benchmarkForAllArrays kruskals ark

main = do
  putStrLn "\n\nSelecione o módulo desejado:"
  putStrLn "(1) Grafos"
  opcao <- getLine
  case opcao of
    "1" -> menuGrafo
