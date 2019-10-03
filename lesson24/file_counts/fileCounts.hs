-- import System.IO
-- import System.Environment
-- 
-- getCounts :: String -> (Int,Int,Int)
-- getCounts input = (charCount, wordCount, lineCount)
--   where charCount = length input
--         wordCount = (length . words) input
--         lineCount = (length . lines) input
-- 
-- countsText :: (Int,Int,Int) -> String
-- countsText (cc,wc,lc) = unwords ["chars: ", show cc, " words: ", show wc, " lines: ", show lc]
-- 
-- main :: IO ()
-- main = do
--   args <- getArgs
--   let fileName = head args
--   file <- openFile fileName ReadMode
--   input <- hGetContents file
--   let summary = (countsText . getCounts) input
--   putStrLn summary
--   hClose file
--   appendFile "stats.dat" (mconcat [fileName, " ",summary, "\n"])


{-# LANGUAGE OverloadedStrings #-}

import System.IO
import System.Environment
import qualified Data.Text as T
import qualified Data.Text.IO as TI

getCounts :: T.Text -> (Int,Int,Int)
getCounts input = (charCount, wordCount, lineCount)
 where charCount = T.length input
       wordCount = (length . T.words) input
       lineCount = (length . T.lines) input

countsText :: (Int,Int,Int) -> T.Text
countsText (cc,wc,lc) = T.pack (unwords ["chars: " , show cc , " words: " , show wc , " lines: " ,  show lc])

main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  input <- TI.readFile fileName
  let summary = (countsText . getCounts) input
  TI.appendFile "stats.dat"
                (mconcat [(T.pack fileName), " ",summary, "\n"])
  -- TI.putStrLn summary
  TI.putStrLn "Done!"

