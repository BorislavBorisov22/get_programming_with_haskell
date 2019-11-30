module Main where
import Palindrome

main ::IO ()
main = do
  print "Enter a wod and I'll let you know if it's a palindome!"
  text <- getLine
  let response = if isPalindrome text
                 then "it is!"
                 else "it's not!"
  print response

