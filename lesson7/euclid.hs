module Euclid where

-- Euclid's method for finding the greatest common divisor
-- The largest number that even divides two numbers
-- e.g. for 20 and 16 it is 4

myGCD a b =
  if remainder == 0
  then b
  else myGCD b remainder

  where remainder = a `mod` b

