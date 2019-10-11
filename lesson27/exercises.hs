module Exercises where


-- Q27.1
-- 
data Box a = Box a deriving Show

instance Functor Box where
   fmap func (Box val)  = Box (func val)

-- I got this from the errata
morePresents :: Int -> Box a -> Box [a]
morePresents count present = fmap (nCopies count) present
  where nCopies count item = (take count . repeat) item

-- Q27.2
myBox :: Box Int
myBox = Box 1

unwrap :: Box a -> a
unwrap (Box val) = val
