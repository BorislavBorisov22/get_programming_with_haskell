import qualified Data.Map as Map

helloPerson :: String -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"

sampleMap :: Map.Map Int String
sampleMap = Map.fromList [(1,"Will")]

mainMaybe :: Maybe String
mainMaybe = do
  name <- Map.lookup 1 sampleMap
  let statement = helloPerson name
  return statement

