module SelectionSort(selectionSort) where
-- Selection Sort

menor :: (Ord a) => [a] -> a
menor [r] = r
menor (r:x:xs) | r <= x = menor(r:xs)
               | otherwise = menor(x:xs)

excluir :: (Ord a) => a -> [a] -> [a]
excluir _ [] = []
excluir r (x:xs)    | r == x = xs
                    | otherwise = x : excluir  r xs
selectionSort :: (Ord a) => [a] -> [a]
selectionSort [] = []
selectionSort xs = let  x = menor xs  
           in  x : selectionSort (excluir x xs) 