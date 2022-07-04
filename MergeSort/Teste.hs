module Teste where

import System.IO
import Data.Char
import MergeSort (mergeSort, divide, merge)

teste1 = do 
    valores <- readFile "100000.txt"
    print (mergeSort (map read $ words valores :: [Int]))


teste2 = do 
    valores <- readFile "10000.txt"
    print (mergeSort (map read $ words valores :: [Int]))
