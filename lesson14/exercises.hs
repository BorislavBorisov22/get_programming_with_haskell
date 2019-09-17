module Exercises where

-- Q14.1
-- Note that Enum doesn’t require either Ord or Eq, even though it maps types
-- to Int values (which implement both Ord and Eq). Ignoring the fact that you
-- can easily use deriving for Eq and Ord, use the derived implementation of
-- Enum to make manually defining Eq and Ord much easier.

-- Q14.2
-- Define a five-sided die (FiveSidedDie type). Then define a type class named
-- Die and at least one method that would be useful to have for a die. Also
-- include superclasses you think make sense for a die. Finally, make your
-- FiveSidedDie an instance of Die.

data FiveSidedDie = Side1 | Side2 | Side3 | Side4 | Side5 deriving (Enum, Eq, Show)

class (Eq a, Enum a) => Die a where
  roll :: Int -> a

instance Die FiveSidedDie where
  roll n = toEnum (n `mod` 5)

