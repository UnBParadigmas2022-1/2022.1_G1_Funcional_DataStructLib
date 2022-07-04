module BellmanFord (
  bellmanFord
) where

import Data.Maybe
import Data.List
import qualified Data.Map as Map
import WeightedGraph

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


bellmanFord :: Graph -> String -> [(String, Double)]
bellmanFord grafo inicio = helperFn ultimoElemento grafo distancias
  where 
    distancias = criaResultados (nodes grafo) inicio
    ultimoElemento = length distancias
