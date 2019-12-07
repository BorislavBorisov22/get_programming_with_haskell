module Main where

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as LC
import Network.HTTP.Simple

-- this didn't work and I don't know how to get it working
-- myToken :: BC.ByteString
-- myToken = L.readFile "noaa-token"

noaaHost :: BC.ByteString
noaaHost = "www.ncdc.noaa.gov"

apiPath :: BC.ByteString
apiPath = "/cdo-web/api/v2/datasets"

buildRequest :: BC.ByteString -> BC.ByteString -> BC.ByteString -> BC.ByteString -> Request
buildRequest token host method path = setRequestMethod method
                                  $ setRequestHost host
                                  $ setRequestHeader "token" [token]
                                  $ setRequestPath path
                                  $ setRequestSecure True
                                  $ setRequestPort 443
                                  $ defaultRequest

request :: BC.ByteString -> Request
request myToken = buildRequest myToken noaaHost "GET" apiPath

main :: IO ()
main = do
  -- noaa-token had a trailing newline, which produced an error
  -- noaa-token-new was produced with:
  -- printf %s "$(< noaa-token)" > noaa-token-new
  myToken <- B.readFile "noaa-token-new"
  response <- httpLBS (request myToken)
  let status = getResponseStatusCode response
  if status == 200
  then do
       print "saving request to file"
       let jsonBody = getResponseBody response
       L.writeFile "data.json" jsonBody
  else print "request failed with error"

