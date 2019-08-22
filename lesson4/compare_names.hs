module CompareNames where

import Data.List

names = [("Ian", "Curtis"),
         ("Peter", "Jeb"),
         ("Peter", "Abe"),
         ("Bernard","Sammy"),
         ("Peter", "Hook"),
         ("Bernard","Sumner"),
         ("Stephen","Morris")]

compareLastNames name1 name2 = if lastName1 > lastName2
                               then GT
                               else if lastName1 < lastName2
                               then LT
                               else if firstName1 > firstName2
                                    then GT
                                    else if firstName1 < firstName2
                                         then LT
                                         else EQ

  where lastName1 = snd name1
        lastName2 = snd name2
        firstName1 = fst name1
        firstName2 = fst name2

-- answer to question 4.1 - rewrite using compare function
compareLastNames' name1 name2 = if lastComparison == EQ
                                then firstComparison
                                else lastComparison

  where lastName1 = snd name1
        lastName2 = snd name2
        firstName1 = fst name1
        firstName2 = fst name2
        lastComparison = compare lastName1 lastName2
        firstComparison = compare firstName1 firstName2

