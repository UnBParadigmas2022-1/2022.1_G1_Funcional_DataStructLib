module TesteLista (testeCriaLista, testeAdicionaElemento, testeRemoveElemento, testeReverse, testeMaiorValor) where
import Data.Char
import System.IO

import Lista(append, removeElement, reverseList, maximumValue)

testeCriaLista = do
    valores <- readFile "./assets/MilElementos.txt"
    let list = map read $ words valores :: [Int]
    print (list)

testeAdicionaElemento = do
    valores <- readFile "./assets/MilElementos.txt"
    let list = map read $ words valores :: [Int]
    print (append 20 list)
    a <- randomNumber 1 100
    print (append a list)

testeRemoveElemento = do
    valores <- readFile "./assets/MilElementos.txt"
    let list = map read $ words valores :: [Int]
    print (removeElement list)

testeReverse = do
    valores <- readFile "./assets/MilElementos.txt"
    let list = map read $ words valores :: [Int]
    print (reverseList list)

testeMaiorValor = do
    valores <- readFile "./assets/MilElementos.txt"
    let list = map read $ words valores :: [Int]
    print (maximumValue list)
