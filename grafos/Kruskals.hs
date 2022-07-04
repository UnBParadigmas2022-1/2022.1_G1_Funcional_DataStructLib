module Kruskals (
  kruskals
) where

import Data.Maybe
import Data.List
import qualified Data.Map as Map
import WeightedGraph

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

kruskals:: Graph -> [Aresta]
kruskals grafo = kruskalHelper limiteVertices 0 subsets' []
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

