module Exercises where

-- Q11.1
-- filter's type:  filter :: (a -> Bool) -> [a] -> [a]
-- filter returns something of the same type as it was

-- map's type: map :: (a ->b) -> [a] -> [a]
-- map applies the function, which can change the result type


-- Q11.2
-- Can you write a version of head that returns an empty list if the given
-- list is empty?
myHead :: [a] -> a
myHead = undefined
-- No.  It must return one type or the other, not both.


-- Q11.2
-- What is the type signature?
-- myFoldl :: (a -> a) -> List -> a
-- Actual was:
-- myFoldl :: (t -> a -> t) -> t -> [a] -> t

-- I don't completely understand

myFoldl f init [] = init
myFoldl f init (x:xs) = myFoldl f newInit xs
  where newInit = f init x

