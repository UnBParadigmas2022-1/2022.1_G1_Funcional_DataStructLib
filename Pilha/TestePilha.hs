module TestePilha where

import Pilha(isEmpty,push,pop,top)

main = do
    

    let a = []
    let b = push a 1
    print (b)
    let a = push b 10
    print (a)
    let b = push a 14
    print (b)
    let a = push b 18
    print (a)
    let b = pop a
    let a = push b 34
    print (a)
    let b = pop a
    let a = push b 6
    print (a)
    let b = pop a
    let a = push b 8
    print (a)
    let b = pop a
    let a = push b 17
    print (a)
    let b = pop a
    let a = push b 2
    print (a)
    let b = pop a
    let a = push b 9
    print (a)
    let b = pop a
    print (b)