import System.IO

-- knows file only has two lines
-- main :: IO ()
-- main = do
--   helloFile <- openFile "hello.txt" ReadMode
--   firstLine <- hGetLine helloFile
--   putStrLn firstLine
--   secondLine <- hGetLine helloFile
--   goodbyeFile <- openFile "goodbye.txt" WriteMode
--   hPutStrLn goodbyeFile secondLine
--   hClose helloFile
--   hClose goodbyeFile
--   putStrLn "done!"

main :: IO ()
main = do
  helloFile <- openFile "hello.txt" ReadMode
  hasLine <- hIsEOF helloFile
  firstLine <- if not hasLine
               then hGetLine helloFile
               else return "empty"
  putStrLn "done!"

