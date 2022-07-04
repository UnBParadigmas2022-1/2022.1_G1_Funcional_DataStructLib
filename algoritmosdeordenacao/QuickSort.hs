module QuickSort (quickSort) where

-- QuickSort com alterações
-- fonte: https://github.com/anabxms/algoritmos-ordenacao/blob/main/sorting_algorithms.hs


left :: (Ord a) => [a] -> [a]
left [] = []
left (x:xs) = filter (<x) xs

right :: (Ord a) => [a] -> [a]
right [] = []
right (x:xs) = filter (>=x) xs

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort (left (x:xs)) ++ [x] ++ quickSort (right (x:xs))