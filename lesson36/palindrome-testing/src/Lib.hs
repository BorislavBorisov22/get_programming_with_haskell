module Lib where

import Data.Char(isPunctuation)
import Data.Text as T

preProcess :: T.Text -> T.Text
preProcess text = T.filter (not . isPunctuation) text

isPalindrome :: T.Text -> Bool
isPalindrome text = cleanText == T.reverse cleanText
  where cleanText = preProcess text

