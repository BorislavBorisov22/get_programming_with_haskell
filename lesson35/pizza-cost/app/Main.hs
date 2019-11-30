module Main where

import Lib
import Data.Text as T
import Data.Text.IO as TIO

main :: IO ()
main = do
   TIO.putStrLn "What is the size of pizza 1"
   size1 <- TIO.getLine
   TIO.putStrLn "What is the cost of pizza 1"
   cost1 <- TIO.getLine
   TIO.putStrLn "What is the size of pizza 2"
   size2 <-  TIO.getLine
   TIO.putStrLn "What is the cost of pizza 2"
   cost2 <- TIO.getLine
   let pizza1 = (read (T.unpack size1), read (T.unpack cost1))
   let pizza2 = (read (T.unpack size2), read (T.unpack cost2))
   let betterPizza = comparePizzas pizza1 pizza2
   TIO.putStrLn (describePizza betterPizza)

