module Exercises where

-- Q13.1
-- Explore Word with :info.  How does it differ from Int?
-- They are identical, except Int can be negative, and Word is only positive

-- Q13.2
-- No difference between succ function for Int and Word type classes

-- Q13.3
-- Write the following function that works just like succ on Bounded types but
-- can be called an unlimited number of times without error.

-- I had to look.  I didn't understand, but now it looks so easy/trivial.
cycleSucc :: (Bounded a, Enum a, Eq a) => a -> a
cycleSucc n = if n == maxBound
              then minBound
              else succ n

