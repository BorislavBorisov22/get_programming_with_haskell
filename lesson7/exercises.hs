module Exercises where

-- Q1
-- No, because the remainder is always smaller and always what you want to work
-- with next, no matter which of the numbers is larger

--Q7.1
myTail (_:xs) = xs
myTail [] = []

--Q7.2 = use pattern matching
myGCD a 0 = a
myGCD a b =
  myGCD b remainder

  where remainder = a `mod` b

-- myGCD' a b =
--   if remainder == 0
--   then b
--   else myGCD b remainder
-- 
--   where remainder = a `mod` b

