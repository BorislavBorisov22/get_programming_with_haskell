import System.Environment as SE
import Control.Monad as CM

main :: IO ()
main = do
  args <- SE.getArgs
  let linesToRead = if length args > 0
                    then read (head args)
                    else 0 :: Int
  numbers <- CM.replicateM linesToRead getLine
  let ints = map read numbers :: [Int]
  print (sum ints)

