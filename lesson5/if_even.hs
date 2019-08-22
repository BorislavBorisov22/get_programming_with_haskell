module IfEven where

-- use closer to generate functions
genIfEven f = (\x -> ifEven f x)

-- can pass in a function to apply to x if x is even
genIfXEven x = (\f -> ifEven f x)
ifEven f x = if even x
             then f x
             else x

inc n = n + 1
double n = n + n
square n = n * n
cube n = n * n * n

ifEvenInc' = genIfEven inc
ifEvenInc n = ifEven inc n

ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n
ifEvenCube n = ifEven cube n

-- Q5.1
ifEvenInc'' n = ifEven inc n
ifEvenDouble'' n = ifEven double n
ifEvenSquare'' n = ifEvenSquare n

