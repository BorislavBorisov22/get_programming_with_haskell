echo :: IO ()
echo = getLine >>= putStrLn

-- >> commonly used with IO when there isn't a meaninful result to return
-- so it is thrown away (like the prompt here)
echoVerbose :: IO ()
echoVerbose = putStrLn "Enter a String and we'll echo it!" >>
              getLine >>= putStrLn

main :: IO ()
-- main = echo
main = echoVerbose

