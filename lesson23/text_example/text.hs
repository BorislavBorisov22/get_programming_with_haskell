{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import Data.Semigroup

combinedTextMonoid :: T.Text
combinedTextMonoid = mconcat ["some"," ","text"]

combinedTextSemigroup :: T.Text
combinedTextSemigroup = "some" <> " " <> "text"

-- cannot do this without the LANGUAGE pragma above
-- or by using the -XOverloadedStrings when compiling
-- the pragma is preferred to avoid forgetting about
-- the -X option

aWord :: T.Text
aWord = "Cheese"

main :: IO ()
main = do
  print aWord

