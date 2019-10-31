askForName :: IO ()
askForName = putStrLn "What is your name?"

nameStatement :: String -> String
nameStatement name = "Hello, " ++ name ++ "!!"


helloName = askForName >>
            getLine >>= 
            (\name -> return (nameStatement name)) >>=
            putStrLn

main :: IO ()
main = helloName

