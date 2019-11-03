askForName :: IO ()
askForName = putStrLn "What is your name?"

nameStatement :: String -> String
nameStatement name = "Hello, " ++ name ++ "!"

helloName :: IO ()
helloName = askForName >>
            getLine >>=
            (\name -> return (nameStatement name)) >>=
            putStrLn

-- do notation is syntactic sugar for the Monadic methods
helloNameDo :: IO ()
helloNameDo = do
   askForName
   name <- getLine
   putStrLn (nameStatement name)

main :: IO ()
--main = helloName
main = helloNameDo

