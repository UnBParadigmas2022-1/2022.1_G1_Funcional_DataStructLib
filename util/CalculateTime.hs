-- Fonte: https://github.com/UnBParadigmas2020-2/2020.2_G4_Funcional_SortBenchmark/blob/master/app/CalculateTime.hs
--
module CalculateTime(benchmarkForAllArrays) where

import Text.Printf
import Control.Exception
import System.CPUTime


printBenchmark timeSpent = printf "Tempo levado: %0.8f sec\n" (timeSpent)

time :: IO t -> IO t
time a = do
    start <- getCPUTime
    v <- a
    end   <- getCPUTime
    let diff = (fromIntegral (end - start)) / (10^12)
    printBenchmark (diff :: Double)
    return v

benchmarkForAllArrays algorithm argument = do 
    time ((algorithm argument) `seq` return ())
