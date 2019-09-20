module Exercises where

--Q17.1
--Give Color an identity and make it an instance of Monoid

data Color = Red | Yellow | Blue | Green | Purple | Orange | Brown
           | Clear deriving (Show,Eq)

instance Semigroup Color where
  (<>) Clear any = any
  (<>) any Clear = any
  (<>) Red Blue = Purple
  (<>) Blue Red = Purple
  (<>) Yellow Blue = Green
  (<>) Blue Yellow = Green
  (<>) Yellow Red = Orange
  (<>) Red Yellow = Orange
  (<>) a b | a == b = a
           | all (`elem` [Red,Blue,Purple]) [a,b] = Purple
           | all (`elem` [Blue,Yellow,Green]) [a,b] = Green
           | all (`elem` [Red,Yellow,Orange]) [a,b] = Orange
           | otherwise = Brown

instance Monoid Color where
   mempty = Clear
   -- mappend = col1 col2 = col1 <> col2
   mappend = (<>)

