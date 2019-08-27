module SayAmount where

sayAmmount' n =
  case n of
    1 -> "one"
    2 -> "two"
    n -> "a bunch"

-- pattern matching version
sayAmmount 1 = "one"
sayAmmount 2 = "two"
--sayAmmount n = "a bunch"
sayAmmount _ = "a bunch"
