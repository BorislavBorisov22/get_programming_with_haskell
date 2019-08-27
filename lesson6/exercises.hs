module Erexercises where

-- Q6.1
myRepeat x = cycle [x]

-- Q6.2
-- subseq 2 5 [1 .. 10] = [3,4,5]
subseq start_pos end_pos list = 
  drop start_pos taken

  where
    taken = take end_pos list

-- Q6.3
-- Is e in the first half of l?
inFirstHalf' e l =
  -- I was SOOO close, just too tired to see how close I was!
  True

  where
    lookIn = take (length l `div` 2) l

-- This was the answer from the book.
-- I was struggling to do it with the information
-- provided so far.
--
-- What is val?

inFirstHalf val myList =
  val `elem` firstHalf

  where
    midpoint = (length myList) `div` 2
    firstHalf = take midpoint myList

