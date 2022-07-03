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
  
data Aresta = Aresta String String Double deriving (Show)  

data Subset = Subset Int Int deriving (Show)

isInList:: [Aresta] -> Aresta -> Int
isInList arestas (Aresta origem destino _) = fromMaybe (-1) (findIndex(\(Aresta origem2 destino2 _) -> origem == destino2 && destino == origem2) arestas)

withIndex:: [a] -> [(Int, a)]
withIndex list = zip [1..] list

withoutIndex:: [(Int, a)] -> [a]
withoutIndex list = snd(unzip list)

filtraDuplicados:: [Aresta] -> [Aresta]
filtraDuplicados arestas = withoutIndex (filter(\(indice, aresta) -> indice < (isInList arestas aresta)) (withIndex arestas))

mapeiaNo:: (String, Map.Map String Double) -> [Aresta]
mapeiaNo (noAtual, vizinhos)
  | Map.null vizinhos = []
  | otherwise = aresta : mapeiaNo no'
    where 
      vizinhoAtual = Map.elemAt 0 vizinhos
      nomeVizinhoAtual = fst vizinhoAtual
      pesoVizinhoAtual = snd vizinhoAtual
      novosVizinhos = Map.delete nomeVizinhoAtual vizinhos
      no' = (noAtual, novosVizinhos)
      aresta = Aresta noAtual nomeVizinhoAtual pesoVizinhoAtual

organizaArestas:: Graph -> [Aresta]
organizaArestas grafo 
  | (Map.null grafo) = []
  | otherwise =  mapeiaNo elem ++ organizaArestas grafo'
    where 
      elem = Map.elemAt 0 grafo
      nomeElem = fst elem
      grafo' = Map.delete nomeElem grafo


grafoParaLista:: Graph -> [Aresta]
grafoParaLista grafo = organizaArestas grafo

initUnionFind:: [a] -> [Subset]
initUnionFind arestas = initUnionFindHelper 0
  where 
    initUnionFindHelper:: Int -> [Subset]
    initUnionFindHelper indice
      | indice > length arestas = []
      | otherwise = Subset indice 0 : initUnionFindHelper (indice + 1)

find':: [Subset] ->  Int -> Int
find' subsets i 
  | (elem == i) = i
  | otherwise = find' subsets elem
  where 
    (Subset parent rank) = subsets !! i
    elem = parent

trocaElemento:: [Subset] -> Int -> Int -> Int -> [Subset]
trocaElemento lista indice novoParent novoRank = inicioLista ++ [Subset novoParent novoRank] ++ fimLista
  where
    (Subset parent rank) = lista !! indice
    (inicioLista,_:fimLista) = splitAt indice lista

trocaElementos:: [Subset] -> [Int] -> [Int] -> [Int] -> [Subset]
trocaElementos lista [] _ _ = lista
trocaElementos lista (indiceAtual:restoIndices) (novoParentAtual:restoParents) (novoRankAtual:restoRanks) = trocaElementos novaLista restoIndices restoParents restoRanks
  where
    (inicioLista,_:fimLista) = splitAt indiceAtual lista
    novaLista = inicioLista ++ [Subset novoParentAtual novoRankAtual] ++ fimLista

applyUnion:: [Subset] -> Int -> Int -> [Subset]
applyUnion subsets x y 
  | (xrootRank < yrootRank) = trocaElemento subsets xroot yroot xrootRank
  | (xrootRank > yrootRank) = trocaElemento subsets yroot xroot yrootRank
  | otherwise = trocaElementos subsets indices parents' ranks'
    where
      xroot = find' subsets x
      yroot = find' subsets y
      (Subset xrootParent xrootRank) = subsets !! xroot 
      (Subset yrootParent yrootRank) = subsets !! yroot 
      indices = [yroot, xroot]
      parents' = [xroot, xrootParent]
      ranks' = [yrootRank, (xrootRank + 1)]

pegaIndice:: [String] -> String -> Int
pegaIndice lista elemento = fromJust (elemIndex elemento lista)

kruskal:: Graph -> [Aresta]
kruskal grafo = kruskalHelper limiteVertices 0 subsets' []
  where 
    arestas = grafoParaLista grafo
    vertices = nodes grafo
    limiteVertices = ((length vertices) - 1)
    listaOrdenada = sortBy (\ (Aresta _ _ w1) (Aresta _ _ w2) -> compare w1 w2) arestas
    subsets' = initUnionFind (nodes grafo)
    kruskalHelper:: Int -> Int -> [Subset] -> [Aresta] -> [Aresta]
    kruskalHelper 0 _ _ resultados = resultados 
    kruskalHelper nosRestantes idxArestaAtual subsets resultados 
      | (x /= y) = kruskalHelper (nosRestantes - 1) proximoAresta (applyUnion subsets x y) (arestaAtual : resultados)
      | otherwise = kruskalHelper nosRestantes proximoAresta subsets resultados
      where
        arestaAtual = arestas !! idxArestaAtual
        proximoAresta = idxArestaAtual + 1
        (Aresta origem destino _) = arestaAtual
        idxOrigem = pegaIndice vertices origem
        idxDestino = pegaIndice vertices destino
        x = find' subsets idxOrigem
        y = find' subsets idxDestino

