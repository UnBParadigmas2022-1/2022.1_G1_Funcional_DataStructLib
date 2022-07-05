module Lista(append, removeElement, reverseList, maximumValue) where

-- Adiciona elementos a uma lista pré-definida e retorna lista
append :: Int -> [Int] -> [Int]
append a [] = [a]
append a (x:xs) = x : append a xs

-- Remove último elemento de uma lista
removeElement :: [Int] -> [Int]
removeElement [] = []               -- Em caso de lista vazia
removeElement xs = init xs

-- Implementa reverse na lista
reverseList :: [Int] -> [Int]
reverseList [] = []                 -- Em caso de lista vazia
reverseList (x:xs) = reverseList xs ++ [x]

-- Pega o maior valor presente na lista
maximumValue :: [Int] -> Int
maximumValue [] = -1
maximumValue xs = maximum xs 