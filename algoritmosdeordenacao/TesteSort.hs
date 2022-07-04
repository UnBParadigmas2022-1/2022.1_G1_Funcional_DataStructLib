module TesteSort() where

import TimeIt
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


doInsertion = do 
    insertionValores <- readFile "./100000.txt"
    print (insertionSort (map read $ words insertionValores :: [Int]))

doSelectionSort  = do 
    selectionSortValores <- readFile "./100000.txt"
    print (selectionSort (map read $ words selectionSortValores :: [Int]))


doBubbleSort  = do 
    bubbleSortValores <- readFile "./100000.txt"
    print (bubbleSort (map read $ words bubbleSortValores :: [Int]))

allSort = do
    doMergeSort
    doQuicksort
    doInsertion
    doSelectionSort
    doBubbleSort
    
selectAlgoSort = do   
    putStrLn "Módulos:"
    putStrLn "(1) Merge Sorts"
    putStrLn "(2) Quicksort"
    putStrLn "(3) Insertion"
    putStrLn "(4) SelectionSort"
    putStrLn "(5) BubbleSort"
    putStrLn "(6) All"
    putStr "Selecione o módulo desejado: "
    opcao <- getLine
    case opcao of
        "1" -> timeIt $doMergeSort
        "2" -> timeIt $doQuicksort
        "3" -> timeIt $doInsertion
        "4" -> timeIt $doSelectionSort
        "5" -> timeIt $doBubbleSort
        "6" -> timeIt $allSort