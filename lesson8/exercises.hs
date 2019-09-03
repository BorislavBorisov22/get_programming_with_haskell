module Exercises where

-- Q8.1
myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]

-- Q8.2
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- using :set +s
-- fib 10 took 0.01 sec  (answer 55)
-- fib 20 took 0.03 sec  (answer 6765)
-- fib 30 took 2.23 sec  (answer 832040)
-- fib 40 took 22.23 sec (answer 102334155)

-- fib'   40 took 0.01 sec (answer 102334155)
-- fib'  100 took 0.01 sec (answer 354224848179261915075)
-- fib' 1000 took 0.01 sec (answer 43466557686937456435688527675040625802564660517371780402481729089536555417949051890403879840079255169295922593080322634775209689623239873322471161642996440906533187938298969649928516003704476137795166849228875)

-- 5th fib    -> fastFib 1 1 5
-- 1000th fib -> fastFib 1 1 1000

-- I got this out of the book, because I'm lazy and thinking of
-- alternative fib solutions seems like it is getting in the way
-- of learning Haskell.
-- I was sort of on the right path though. ;)

fastFib _ _ 0 = 0
fastFib _ _ 1 = 1
fastFib _ _ 2 = 1
fastFib x y 3 = x + y
fastFib x y c = fastFib (x + y) x (c - 1)

fib' n = fastFib 1 1 n

