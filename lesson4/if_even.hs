module IfEven where

ifEven myFunction x = if even x
                      then myFunction x
                      else x

inc n = n + 1
double n = n + n
square n = n * n
cube n = n * n * n

ifEvenInc n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n
ifEvenCube n = ifEven cube n

