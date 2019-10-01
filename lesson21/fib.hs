fastFib _ _ 0 = 0
fastFib _ _ 1 = 1
fastFib _ _ 2 = 1
fastFib x y 3 = x + y
fastFib x y c = fastFib (x + y) x (c - 1)

fib n = fastFib 1 1 n

main :: IO ()
main = do
  putStrLn "Enter a number: "
  num <- getLine
  let result = fib (read num)
  -- wouldn't compile until I added show
  putStrLn (show result)

