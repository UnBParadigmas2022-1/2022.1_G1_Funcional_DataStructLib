-- Fonte: http://www.cburch.com/cs/360/assn/03/index.html
-- (Replace with student name(s))
-- Assn 3, due 14 Sep 2012

--
--
-- Dr. Burch's code starts - do not modify or insert before the marker below
import Data.Maybe
import Data.List
import qualified Data.Map as Map


type Graph = Map.Map String (Map.Map String Double)

uniq :: [String] -> [String]
uniq lst = head lst : map snd (Data.List.filter fst (Data.List.zipWith cmpNbrs lst (tail lst)))
  where cmpNbrs x y = (x /= y, y)

makeGraph :: [(String, String, Double)] -> Graph
makeGraph edges = Map.fromList (map makeNode keys)
  where
    keys = uniq (Data.List.sort (map (\(x,y,z)->x) edges ++ map (\(x,y,z)->y) edges))

    findEdgesFrom n [] = []
    findEdgesFrom n ((s, t, w) : rest)
      | n == s    = (t, w) : findEdgesFrom n rest
      | otherwise = findEdgesFrom n rest

    makeNode n = (n, Map.fromList (findEdgesFrom n edges))

weight :: Graph -> String -> String -> Double
weight g s t = Map.findWithDefault 1e100 t smap
  where smap = Map.findWithDefault Map.empty s g

nodes :: Graph -> [String]
nodes g = Map.keys g

neighbors :: Graph -> String -> [String]
neighbors g n = Map.keys (Map.findWithDefault Map.empty n g)

ark = makeGraph (undirEdges ++ map (\(s, t, w) -> (t, s, w)) undirEdges)
  where undirEdges = [("Conway", "Russellville", 44.2),("Conway", "Clinton", 38.2),("Conway", "Heber Springs", 39.0),("Heber Springs", "Mountain View", 41.9),("Clinton", "Mountain View", 34.0),("Clinton", "Marshall", 26.1),("Marshall", "Mountain View", 37.1),("Marshall", "Yellville", 34.1),("Yellville", "Mountain Home", 18.7),("Mountain View", "Mountain Home", 47.3),("Marshall", "Pindall", 20.5),("Pindall", "Yellville", 19.7), ("Russellville", "Pindall", 78.3),("Russellville", "Marshall", 72.0)]


pegaElemento:: [(String, Double)] -> String -> (String, Double)
pegaElemento lista elemento = lista !! fromJust (elemIndex elemento (map (\(nome, distancia) -> nome) lista))

pegaIndice:: [(String, Double)] -> String -> Int
pegaIndice lista elemento = fromJust (elemIndex elemento (map (\(nome, distancia) -> nome) lista))

trocaElemento:: [(String, Double)] -> String -> Double -> [(String, Double)]
trocaElemento lista elemento novoValor = inicioLista ++ [(elemento, novoValor)] ++ fimLista
  where
    indice = pegaIndice lista elemento
    (inicioLista,_:fimLista) = splitAt indice lista

verificaMenorCaminho :: Graph -> String -> String -> [(String, Double)] -> Double
verificaMenorCaminho grafo origem destino distancias = min distanciaAtual distanciaNova
  where 
    distanciaAtual = snd(pegaElemento distancias origem)
    distanciaNova = snd(pegaElemento distancias destino) + (weight grafo origem destino)

criaResultados:: [String] -> String -> [(String, Double)]
criaResultados [] _ = []
criaResultados (noAtual:demaisNos) noInicial = (noAtual, distance) : criaResultados demaisNos noInicial
  where distance = if noAtual == noInicial then 0 else 1e100

atualizaDistancias:: Graph -> String -> String -> [(String, Double)] -> [(String, Double)]
atualizaDistancias grafo noAtual vizinhoAtual distancias = trocaElemento distancias noAtual novoValor
  where novoValor = verificaMenorCaminho grafo noAtual vizinhoAtual distancias

calculaVizinhos:: Graph -> String -> [String] -> [(String, Double)] -> [(String, Double)]
calculaVizinhos _ _ [] distancias = distancias
calculaVizinhos grafo noAtual (vizinhoAtual:demaisVizinhos) distancias = 
  calculaVizinhos grafo noAtual demaisVizinhos distanciasAtualizadas
    where distanciasAtualizadas = atualizaDistancias grafo noAtual vizinhoAtual distancias

calculaDistancia:: Graph -> [String] -> [(String, Double)] -> [(String, Double)]
calculaDistancia _ [] resultados = resultados
calculaDistancia grafo (noAtual:demaisNos) resultados = calculaDistancia grafo demaisNos resultadosAtualizados
  where 
    vizinhos = neighbors grafo noAtual
    resultadosAtualizados = calculaVizinhos grafo noAtual vizinhos resultados

helperFn:: Int -> Graph -> [(String, Double)] -> [(String, Double)]
helperFn indice grafo distancias 
  | (indice < 0) = distancias
  | otherwise = helperFn (indice - 1) grafo novasDistancias
    where 
      novasDistancias = calculaDistancia grafo nos distancias
      nos = nodes grafo


bf :: Graph -> String -> [(String, Double)]
bf grafo inicio = helperFn ultimoElemento grafo distancias
  where 
    distancias = criaResultados (nodes grafo) inicio
    ultimoElemento = length distancias
