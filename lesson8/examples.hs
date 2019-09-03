module Exercises where

myTake _ [] = []
myTake 0 _  = []
myTake n (x:xs) = x:rest 
  where rest = myTake (n - 1) xs

myDrop _ [] = []
myDrop 0 xs  = xs
myDrop n (x:xs) = rest 
  where rest = myDrop (n - 1) xs

-- no need to call tail with pattern matching
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

finiteCycle (first:rest) = first:rest ++ [first]
myCycle (first:rest) = first:myCycle (rest++[first])

-- Patalogical recursion with the Ackermann function
-- TODO: go read more about this
-- If m = 0, return n + 1.
-- If n = 0, then A(m – 1, 1).
-- If both m != 0 and n != 0, then A(m –1, A(m, n – 1)).
ackermann 0 n = n + 1
ackermann m 0 = ackermann (m - 1) 1
ackermann m n = ackermann (m - 1) (ackermann m (n - 1))


-- The Collatz conjecture is the supposition that your collatz function always
-- terminates, but there’s no proof that this is true. If you happen to find a
-- number that locks up GHCi, make a note of it; it could lead to a famous
-- mathematical paper!

-- If n is 1, you’re finished.
-- If n is even, repeat with n/2.
-- If n is odd, repeat with n × 3 + 1.
collatz 1 = 1
collatz n = if even n
            then 1 + collatz (n `div` 2)
            else 1 + collatz (n*3 + 1)

