-- Fonte: http://www.cburch.com/cs/360/assn/03/index.html

module WeightedGraph (
  weight,
  nodes,
  neighbors,
  ark,
  Graph
) where

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
