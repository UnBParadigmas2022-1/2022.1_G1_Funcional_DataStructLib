module BinaryTree (BinaryTree, valuesPreOrder, valuesInOrder, valuesPostOrder, insertElement) where

import GHC.Exts.Heap (GenClosure (value))

data BinaryTree a
  = Empty
  | Node (BinaryTree a) a (BinaryTree a)
  | Leaf a
  deriving (Show)

--  bt = Node (Node (Leaf 4) 3 Empty) 1 (Leaf 2)

treeMap :: (a -> b) -> BinaryTree a -> BinaryTree b
treeMap _ Empty = Empty
treeMap f (Leaf a) = Leaf (f a)
treeMap f (Node left a right) = Node (treeMap f left) (f a) (treeMap f right)

-- treeMap (*2) bt
-- Node (Node (Leaf 8) 6 Empty) 2 (Leaf 4)

instance Functor BinaryTree where
  fmap = treeMap

-- permite usar o treeMap no lugar do fmap, que pode ser usado em listas nativas
-- fmap (*2) bt
-- Node (Node (Leaf 8) 6 Empty) 2 (Leaf 4)

valuesPreOrder :: BinaryTree a -> [a]
valuesPreOrder Empty = []
valuesPreOrder (Leaf a) = [a]
valuesPreOrder (Node left a right) = [a] ++ valuesPreOrder left ++ valuesPreOrder right

-- valuesPreOrder bt
-- [1, 3, 4, 2]

valuesInOrder :: BinaryTree a -> [a]
valuesInOrder Empty = []
valuesInOrder (Leaf a) = [a]
valuesInOrder (Node left a right) = valuesInOrder left ++ [a] ++ valuesInOrder right

-- valuesInOrder bt
-- [4, 3, 1, 2]

valuesPostOrder :: BinaryTree a -> [a]
valuesPostOrder Empty = []
valuesPostOrder (Leaf a) = [a]
valuesPostOrder (Node left a right) = valuesPostOrder left ++ valuesPostOrder right ++ [a]

-- valuesPostOrder bt
-- [4, 3, 2, 1]

insertElement :: (Ord a) => BinaryTree a -> a -> BinaryTree a
insertElement Empty x = Leaf x
insertElement (Leaf a) x
  | a <= x = Node Empty a (Leaf x)
  | a > x = Node (Leaf x) a Empty
insertElement (Node left a right) x
  | a > x = Node (insertElement left x) a right
  | a <= x = Node left a (insertElement right x)