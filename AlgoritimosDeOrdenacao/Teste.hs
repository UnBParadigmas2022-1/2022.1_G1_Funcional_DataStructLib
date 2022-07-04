module Teste where

import System.IO
import Data.Char
import MergeSort (mergeSort)
import QuickSort (quickSort) 
import InsertionSort (insertionSort) 
import SelectionSort(selectionSort) 
import BubbleSort (bubbleSort) 

doMergeSort = do 
    margeValores <- readFile "./100000.txt"
    print (mergeSort (map read $ words margeValores :: [Int]))

doQuicksort = do 
    quickValores <- readFile "./100000.txt"
    print (quickSort (map read $ words quickValores :: [Int]))


doInsertionValores  = do 
    insertionValores <- readFile "./100000.txt"
    print (insertionSort (map read $ words insertionValores :: [Int]))

doSelectionSort  = do 
    selectionSortValores <- readFile "./100000.txt"
    print (selectionSort (map read $ words selectionSortValores :: [Int]))


doBubbleSort  = do 
    bubbleSortValores <- readFile "./100000.txt"
    print (bubbleSort (map read $ words bubbleSortValores :: [Int]))
