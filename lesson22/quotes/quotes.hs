a_quote :: Int -> String 
a_quote(1) = "One"
a_quote(1) = "Two"
a_quote(1) = "Three"
a_quote(4) = "Four"
a_quote(_) = "Whatever"

toInt :: String -> Int
toInt s = read s

main :: IO ()
main = do
  userInput <- getContents
  print userInput

