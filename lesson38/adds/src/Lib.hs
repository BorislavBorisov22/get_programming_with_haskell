module Lib ( addStrInts) where

import Data.Char(isDigit)

data ParsingError = FirstParsingError | SecondParsingError | BothParsingError
instance Show ParsingError where
  show FirstParsingError  = "First is invalid"
  show SecondParsingError = "Second is invalid"
  show BothParsingError   = "Both are invalid"

allDigits :: String -> Bool
allDigits val = all (== True) (map isDigit val)

addStrInts :: String -> String -> Either ParsingError Int
addStrInts val1 val2
  | allDigits val1 && allDigits val2 = Right (read val1 + read val2)
  | not (allDigits val1 || allDigits val2) = Left BothParsingError
  | not (allDigits val1) = Left FirstParsingError
  | otherwise = Left SecondParsingError

