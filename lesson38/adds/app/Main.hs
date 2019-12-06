module Main where

import Lib

main :: IO ()
main = do
  print "Enter the first number:"
  x <- getLine
  print "Enter the second number:"
  y <- getLine
  let result = addStrInts x y
  print result

