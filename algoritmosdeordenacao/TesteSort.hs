module TesteSort(doMergeSorts, doQuicksort, doInsertion, doSelectionSort, doBubbleSort, allSort ) where

import TimeIt
import System.IO
import Data.Char
import MergeSort (mergeSort)
import QuickSort (quickSort) 
import InsertionSort (insertionSort) 
import SelectionSort(selectionSort) 
import BubbleSort (bubbleSort) 

doMergeSorts = do 
    margeValores <- readFile "./assets/100000.txt"
    print (mergeSort (map read $ words margeValores :: [Int]))

doQuicksort = do 
    quickValores <- readFile "./assets/100000.txt"
    print (quickSort (map read $ words quickValores :: [Int]))


doInsertion = do 
    insertionValores <- readFile  "./assets/100000.txt"
    print (insertionSort (map read $ words insertionValores :: [Int]))

doSelectionSort  = do 
    selectionSortValores <- readFile  "./assets/100000.txt"
    print (selectionSort (map read $ words selectionSortValores :: [Int]))


doBubbleSort  = do 
    bubbleSortValores <- readFile "./assets/100000.txt"
    print (bubbleSort (map read $ words bubbleSortValores :: [Int]))

allSort = do
    doMergeSorts
    doQuicksort
    doInsertion
    doSelectionSort
    doBubbleSort
    
