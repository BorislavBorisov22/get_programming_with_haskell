-- Due to the Applicative type class, we only need to define a single
-- type 'User' that works in mutiple contexts using regular String/Int

data User = User
   { name    :: String
   , gamerId :: Int
   , score   :: Int
   } deriving Show

-- User {name = "Sue", gamerId = 1337, score = 9001}i>
-- User "Sue" 1337 9001

serverUsername :: Maybe String
serverUsername = Just "Sue"

serverGamerId :: Maybe Int
serverGamerId =  Just 1337

serverScore :: Maybe Int
serverScore = Just 9001

-- Create a user in the context of Maybe
-- User <$> serverUsername <*> serverGamerId <*> serverScore

readInt :: IO Int
readInt = read <$> getLine

-- Create a user in the context of IO
main :: IO ()
main = do
  putStrLn "Enter a username, gamerId and score"
  user <- User <$> getLine <*> readInt <*> readInt
  print user

