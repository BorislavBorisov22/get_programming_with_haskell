module Probabilities where

-- Probability of heads or tails on a coin flip
-- Event  Probability
-- Heads  0.5
-- Tails  0.5

type Events = [String]
type Probs = [Double]

data PTable  = PTable Events Probs
createPTable :: Events -> Probs -> PTable
createPTable events probs = PTable events normalizedProbs
 where totalProbs = sum probs
       normalizedProbs = map (\x -> x/totalProbs) probs


showPair :: String -> Double -> String
showPair event prob = mconcat [event,"|", show prob,"\n"]

instance Show PTable where
  show (PTable events probs) = "\nEvent|Probability\n" ++ mconcat pairs
    where pairs = zipWith showPair events probs

-- createPTable ["heads","tails"] [0.5,0.5]

-- Cartesion product (all combinations of events and probabilities)
cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2
  where nToAdd = length l2
        repeatedL1 = map (take nToAdd . repeat) l1
        newL1 = mconcat repeatedL1
        cycledL2 = cycle l2

combineEvents :: Events -> Events -> Events
combineEvents e1 e2 = cartCombine combiner e1 e2
  where combiner = (\x y -> mconcat [x,"-",y])

combineProbs :: Probs -> Probs -> Probs
combineProbs p1 p2 = cartCombine (*) p1 p2

instance Semigroup PTable where
  (<>) ptable1 (PTable [] []) = ptable1
  (<>) (PTable [] []) ptable2 = ptable2
  (<>) (PTable e1 p1) (PTable e2 p2) = createPTable newEvents newProbs
    where newEvents = combineEvents e1 e2
          newProbs = combineProbs p1 p2

instance Monoid PTable where
  mempty = PTable [] []
  mappend = (<>)

coin :: PTable
coin = createPTable ["heads","tails"] [0.5,0.5]

spinner :: PTable
spinner = createPTable ["red","blue","green"] [0.1,0.2,0.7]

-- coin <> spinner
--
-- Event|Probability
-- heads-red|5.0e-2
-- heads-blue|0.1
-- heads-green|0.35
-- tails-red|5.0e-2
-- tails-blue|0.1       10% chance of getting tails and blue on spinner
-- tails-green|0.35

-- probability of flipping heads 3 times in a row?
-- mconcat [coin, coin, coin]

