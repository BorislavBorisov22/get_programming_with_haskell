module URLBuilder where

getRequestURL host apiKey resource id =
  host ++ "/" ++ resource ++ "/" ++ id ++ "?token=" ++ apiKey

example_url = getRequestURL "http://example.com" "1337hAsk3ll" "book" "1234"

-- The above can get tedious.  Use a closure to avoid passing the host portion all the time
genHostRequestBuilder host = (\apiKey resource id -> getRequestURL host apiKey resource id)
exampleUrlBuilder = genHostRequestBuilder "http://example.com"

-- Take it a step further by passing in how to generate the host portion
genApiRequestBuilder hostBuilder apiKey = (\resource id -> hostBuilder apiKey resource id)

-- Now you can use the host builder and the api builder together
myExampleUrlBuilder = genApiRequestBuilder exampleUrlBuilder "1337hAsk3ll"

-- Now it is easier to generate a proper URL
another_example_url = myExampleUrlBuilder "book" "1234"

-- 5.2 Q1
genApiRequestBuilderWithResource hostBuilder apiKey resource = (\resource id -> hostBuilder apiKey resource id)
myExampleUrlBuilder' = genApiRequestBuilder exampleUrlBuilder "1337hAsk3ll" "book"

-- 5.3 Q1
newBuilder = getRequestURL "http://example.com" "1337hAsk3ll" "book"
