module InsertionSort(insertionSort) where

-- funcao ordena
ordenador::(Ord a) => a -> [a] -> [a]
ordenador r [] = [r]
ordenador r (x:xs) | r <= x = r:x:xs
                 | otherwise = x : ordenador r xs  


-- funcao insertionSort
insertionSort ::(Ord a) => [a] -> [a]
insertionSort [] = []
insertionSort (x:xs) = ordenador x (insertionSort xs)

