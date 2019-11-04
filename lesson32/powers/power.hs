module Power where
import Control.Monad

powersOfTwoMap :: Int -> [Int]
powersOfTwoMap n = map (\x -> 2^x) [1 .. n]

powersOfTwo :: Int -> [Int]
powersOfTwo n = do
  value <- [1 .. n]
  return (2^value)

powersOfTwoAndThree :: Int -> [(Int,Int)]
powersOfTwoAndThree n = do
  value <- [1 .. n]
  let powersOfTwo = 2^value
  let powersOfThree = 3^value
  return (powersOfTwo,powersOfThree)

allEvenOdds :: Int -> [(Int,Int)]
allEvenOdds n = do
  evenValue <- [2,4 .. n]
  oddValue <- [1,3 .. n]
  return (evenValue,oddValue)

-- uses Control.Monad
evensGuard :: Int -> [Int]
evensGuard n = do
  value <- [1 .. n]
  guard(even value)
  return value

evenSquares :: [Int]
evenSquares = do
   n <- [0 .. 9]
   let nSquared = n^2
   guard(even nSquared)
   return nSquared

