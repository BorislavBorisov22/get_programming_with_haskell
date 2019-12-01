module Main where

import Primes
import Data.Text as T
import Data.Text.IO as TIO
import Data.Text.Read as TR

main :: IO ()
main = do
  TIO.putStrLn "Enter a number to check if it's prime:"
  text <- TIO.getLine
  let number = read $ T.unpack text :: Int
  let result = isPrime number
  let response = if result == Just True
                 then "It is prime!"
                 else "It is not prime."
  TIO.putStrLn response

