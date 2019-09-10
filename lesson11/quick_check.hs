module QuickCheck where

-- Q11.1
halve :: Integer -> Integer
halve i = i `div` 2


-- Q11.2
printDouble :: Integer -> String
printDouble i = show (i + i)

-- Q11.3
makeAddress :: Int -> String -> String -> (Int, String, String)
makeAddress number street town = (number, street, town)
-- desugared
makeAddressLambda = (\number ->
                     (\street ->
                      (\town -> (number, street, town))))

-- example: inc n = n + 1
-- So, in the parens here inc takes an Int and returns an Int
-- ifEven inc 4 ----> 5
-- ifEven inc 3 ----> 3
ifEven :: (Int -> Int) -> Int -> Int
ifEven f n = if even n
             then f n
             else n

