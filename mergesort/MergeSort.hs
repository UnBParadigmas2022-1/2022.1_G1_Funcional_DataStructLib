module MergeSort( mergeSort, divide, merge) where

mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
-- fst (primeiro item da tupla) e snd (segundo item da tupla)
mergeSort xs = merge (mergeSort (fst (divide xs))) (mergeSort (snd (divide xs)))

-- Divide o vetor em dois vetores dentro de uma tupla
divide :: [a] -> ([a],[a])
divide xs = (take (div (length xs) 2) xs, drop (div (length xs) 2) xs)

-- Verifica qual dos dois vetores é o maior e o menor
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | x <= y = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

