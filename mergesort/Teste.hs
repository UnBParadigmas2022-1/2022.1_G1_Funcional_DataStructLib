module Teste where

import System.IO
import Data.Char
import MergeSort (mergeSort, divide, merge)

doMergeSort = do 
    valores <- readFile "./mergesort/100000.txt"
    print (mergeSort (map read $ words valores :: [Int]))
