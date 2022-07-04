module MergeSort (mergeSort) where
-- MergeSorte 


intercala :: Ord a => [a] -> [a] -> [a]
intercala  x [ ] = x
intercala [ ] y  = y
intercala (x:xs) (y:ys) | x <= y    = x : intercala xs (y:ys)
                        | otherwise = y : intercala (x:xs) ys

right :: [a] -> [a]
right xs = take (length xs `div` 2) xs

left :: [a] -> [a]
left xs = drop (length xs `div` 2) xs
                        
mergeSort :: Ord a => [a] -> [a]
mergeSort [ ] = [ ]
mergeSort [x] = [x]
mergeSort xs  = intercala (mergeSort (right xs)) (mergeSort (left xs))
