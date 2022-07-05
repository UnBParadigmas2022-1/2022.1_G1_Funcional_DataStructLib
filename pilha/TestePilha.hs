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
    let b = push a 11
    print (b)
    let a = push b 20
    print (a)
    let b = push a 13
    print (b)
    let a = push b 21
    print (a)
    let b = push a 32
    print (b)


    let a = pop b
    print (a)
    let b = pop a
    print (b)
    let a = pop b
    print (a)