module Exercises where

import qualified Data.Map as Map

data Triple a = Triple a a a deriving Show

data Box a = Box a deriving Show

-- Q18.1
-- For the types Triple and Box, implement a function similar to map, tripleMap, and boxMap.

boxMap :: (a -> b) -> Box a -> Box b
boxMap func (Box val) = Box (func val)

tripleMap :: (a -> b) -> Triple a -> Triple b
tripleMap func (Triple v1 v2 v3) = Triple (func v1) (func v2) (func v3)


-- Q18.2
-- Modify the Organ type so that it can be used as a key. Then build a Map, organ-Inventory, of each organ to its count in the organCatalog.

-- orig
-- data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq)

data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq, Ord, Enum)

organs :: [Organ]
organs = [Heart,Heart,Brain,Spleen,Spleen,Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24]

allOrgans :: [Organ]
allOrgans = [Heart .. Spleen]

organPairs :: [(Int,Organ)]
organPairs = zip ids organs

organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs

organCounts :: [Int]
organCounts = map countOrgan allOrgans
  where countOrgan = (\organ ->
                       (length . filter (== organ)) values)

values :: [Organ]
values = map snd (Map.toList organCatalog)

organInventory :: Map.Map Organ Int
organInventory = Map.fromList (zip allOrgans organCounts)

-- organInventory
-- fromList [(Heart,2),(Brain,1),(Kidney,1),(Spleen,2)]

