module Prime where

-- Compute a list of prime numbers using the Applicative properties of a list
--
-- Three steps:
-- 1. Start with list of 2 to n.
-- 2. Determine all non-prime numbers (composite numbers).
-- 3. Filter out all items from the list that aren't composite.

primesToN :: Integer -> [Integer]
primesToN n = filter isNotComposite twoThroughN
  where twoThroughN = [2 .. n]
        composite = pure (*) <*> twoThroughN <*> twoThroughN
        isNotComposite = not . (`elem` composite)

