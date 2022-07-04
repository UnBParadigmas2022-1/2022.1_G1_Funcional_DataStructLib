-- Pilha usando lista

module Pilha(isEmpty,push,pop,top) where

-- Inserção
-- Função que insere elementos em uma pilha, recebe uma lista e o elemento que será inserido nessa lista
push :: [Int] -> Int -> [Int]

push pilha a = pilha ++ [a]

-- Remoção
-- Função que remove elementos da pilha do topo
pop :: [Int] -> [Int]

-- Se a lista for fazia, entra na função error
pop [] = error "Pilha vazia"
-- Se a for igual ao elemento do topo, retorno ab
pop (a:ab) | (a == (top(a:ab))) = ab
           | otherwise = a:(pop ab)

-- Topo
-- Função topo, recebe uma lista e retorna um elemento
top :: [Int] -> Int

-- Se sobrou só um elemento na lista, ele é o topo
top [a] = a

-- Se a lista tem mais de um elemento, fornece a calda da lista pra retirar a cabeça
top (a:ab) = top ab

-- Verifica se a pilha está vazia
isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty _ = False





