module BubbleSort(bubbleSort) where
-- Bubble Sort


ordenador :: (Ord a) => [a] -> Bool
ordenador [] = True
ordenador [r] = True
ordenador (r:x:xs) |  r <= x = ordenador (x:xs)
                  | otherwise =  False  


menor' :: (Ord a) => a -> a -> a
menor' r x  | r <= x = r
           | otherwise = x

maior :: (Ord a) => a -> a -> a
maior r x  | r >= x = r
           | otherwise = x


bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort [] = []
bubbleSort [r] = [r]
bubbleSort (r:x:xs)    | ordenador par = par 
                   | otherwise =  bubbleSort par
    where par = menor' r x : bubbleSort (maior r x : xs) 


