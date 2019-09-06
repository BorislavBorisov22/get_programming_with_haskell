module Exercises where
import Data.Char

myFilter test [] = []
myFilter test (x:xs) = if test x
                       then x:myFilter test xs
                       else myFilter test xs

myRemove test [] = []
myRemove test (x:xs) = if test x
                       then myRemove test xs
                       else x:myRemove test xs

myProduct xs = foldl (*) 1 xs

-- Q9.1
-- Use filter and length to recreate the elem function
myElem x xs = length (filter (\x' -> x' == x) xs) > 0

-- Q9.2
-- Use map and filter to make sure "A man a plan a canal Panama" is a palindrome

isPalindromeOriginal word = word == reverse word
isPalindrome word =
  all_lower == reverse all_lower

  where
    no_spaces = filter (\x -> x /= ' ') word
    all_lower = map toLower no_spaces

-- Q9.3
-- A harmonic series is the sum of 1/1 + 1/2 + 1/3 ... + 1/n
-- Write harmonic to calculate this to n and use lazy evaluation
harmonic n =
  foldl (+) 0 (map (1 /) denominators)

  where
    denominators = take n [1 ..]

