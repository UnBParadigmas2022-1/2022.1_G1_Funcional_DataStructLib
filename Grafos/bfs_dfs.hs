import Control.Monad
import Data.Maybe
import Data.List
-- Grafo não-direcional

data ArestaGrafoNaoDirecionado a = Agn (a,a) deriving Show -- definido a aresta do grafo como um novo tipo de dado
                                          -- Constructor recebendo duas arestas

(<->) a b = Agn (a,b) -- função construtora que pega a e b e gera uma aresta

instance Eq a => Eq (ArestaGrafoNaoDirecionado a) where
    (==) (Agn (a1,b1)) (Agn (a2,b2)) = (a1 == a2 && b1 == b2) || (a1 == b1 && b1 == a1) -- "implementado a função de igualdade entre arestas

data Graph a = G [ArestaGrafoNaoDirecionado a] deriving Show -- Grafos são listas de arestas. Aqui, definimos o construtor

g = G [Agn ('a','b'), Agn ('b','c') , Agn ('x','a'), Agn ('b','z'), Agn ('z','c'), Agn ('a','w'), Agn ('c','w')]

vertices :: Eq a => Graph a -> [a]
vertices (G l) = nub.join $ [[a,b] | (Agn (a,b)) <- l] -- função que retorna os nos do grafo
  
 
op_adj :: Eq a => ArestaGrafoNaoDirecionado a -> a -> Maybe a   
op_adj (Agn (a,b)) x | a == x = Just b
                     | b == x = Just a       
                     | otherwise = Nothing  -- recebe uma lista do tipo 'a' e, para cada elemento, instacia uma aresta

verticesAdjacentesAParam :: Eq a => Graph a -> a -> [a]-- função recebe um grafo e um nó e retorna a lista de vértices adjacentes a ele
verticesAdjacentesAParam (G l) a = catMaybes [ op_adj e a | e <- l]

isVeticesAdjacentes :: Eq a => Graph a -> a -> a -> Bool
isVeticesAdjacentes (G l) a b = elem (Agn (a,b)) l -- verificando se há algo no grafo em relação a'l'

isPasseio :: Eq a => Graph a -> [a] -> Bool
isPasseio _ ([]) = True
isPasseio _ ([a]) = True
isPasseio g (x:y:xs) = (isVeticesAdjacentes g x y) && (isPasseio g (y:xs)) -- Caminho: Qualquer sequência de arestas onde o vértice final de uma aresta é o vertice inicial da próxima


conectarArestasProximas :: [a] -> [ArestaGrafoNaoDirecionado a]
conectarArestasProximas [] = []
conectarArestasProximas [a] = []
conectarArestasProximas (x:y:xs) = (Agn (x,y)) : (conectarArestasProximas $ y:xs)


isTrilha :: Eq a => Graph a -> [a] -> Bool
isTrilha g l = (isPasseio g l) && ((length alle) == (length.nub $ alle)) where alle = conectarArestasProximas l
-- Para ser uma trilha, deve ser uma caminho.
-- Comprimento 

isCaminho :: Eq a => Graph a -> [a] -> Bool
isCaminho g l = (isPasseio g l) && ( (length l) == (length.nub $ l) )

isCaminhoAberto :: Eq a => Graph a -> [a] -> Bool
isCaminhoAberto _ [] = True
isCaminhoAberto _ [a] = True
isCaminhoAberto g list = (head list /= last list) && (( list \\ (vertices g) ) == [])

isCaminhoFechado :: Eq a => Graph a -> [a] -> Bool
isCaminhoFechado g l = not $ isCaminhoAberto g l 

-- Função que retorna todos os caminhos entre um nó e outro

getTodosCaminhos :: Eq a => Graph a -> [a] -> a -> a -> [[a]]
getTodosCaminhos g v pontoInicial pontoFinal | pontoInicial == pontoFinal = [[pontoInicial]]
              | pontoInicial /= pontoFinal = (pontoFinal:) <$> (foldl (++) [] ((getTodosCaminhos g (v++[pontoFinal]) pontoInicial) <$> ((verticesAdjacentesAParam g pontoFinal) \\ v)))

-- Recebe um grafo e retorna uma tupla de duas posições com uma lista em cada
passo_ _ (v,[]) = (v,[])
passo_ g (v,(h:q)) = (v++[h], (((verticesAdjacentesAParam g h) \\ v) \\ q) ++ q )
dfs g a = fst $ fromJust $ find (\(_,q)->null q) $ iterate (passo_ g) ([],[a])


bfs :: Eq a => Graph a -> [a] -> [a] -> [a]
bfs _ _ [] = []
bfs g v (h:qs) = h : (bfs g (h:v) (qs++(((verticesAdjacentesAParam g h) \\) v \\ qs)))
-- Recebemos um grafo, uma lista de arestas visitadas e o ponto inicial e final