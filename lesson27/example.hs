printInt :: Maybe String -> IO ()
printInt Nothing = putStrLn "value missing"
printInt (Just val) = putStrLn val

successfulRequest :: Maybe Int
successfulRequest = Just 6

failedRequest :: Maybe Int
failedRequest = Nothing

incMaybe :: Maybe Int -> Maybe Int
incMaybe (Just n) = Just (n + 1)
incMaybe Nothing = Nothing

-- This is already defined in Prelude
-- instance Functor Maybe where
--   fmap func (Just n) = Just (func n)
--   fmap func Nothing = Nothing

-- <$> is used instead of the official name of fmap
successStr :: Maybe String
successStr = show <$> successfulRequest
successStr' = fmap show successfulRequest

failStr :: Maybe String
failStr = show <$> failedRequest
failStr' = fmap show failedRequest

