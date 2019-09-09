module Cups where

-- by adding message, we have created a constructor
cup flOz = \message -> message flOz

getOz aCup = aCup (\flOz -> flOz)

drink aCup ozDrank = if ozDiff >= 0
                     then cup ozDiff
                     else cup 0
  where flOz = getOz aCup
        ozDiff = flOz - ozDrank

isEmpty aCup = getOz aCup == 0

aCup = cup 6
coffeeCup = cup 12

-- coffeeCup is a closure which captured 12 for flOz
-- So, to get it back out, we get the value of flOz for our coffeeCup
-- getOz coffeeCup is 12
-- afterSip = drink coffeeCup 1
-- afterManySips = foldl drink coffeeCup [1,1,1,1,1]
-- getOz afterManySips is 7

