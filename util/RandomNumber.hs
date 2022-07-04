module RandomNumber(randomNumber)
import System.Random

randomNumber :: Int -> Int -> IO Int
randomNumber x y = getStdRandom (randomR (x,y))