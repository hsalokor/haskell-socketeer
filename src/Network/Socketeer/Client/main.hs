{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Conduit
import Data.Conduit.List (sourceList)
import Data.Conduit.Text (utf8, encode)
import Data.Conduit.Network
import Data.Conduit.Binary (sinkHandle)
import System.IO (stdout)

send :: Application IO
send src sink = do
    sourceList ["Foobar"] $= encode utf8 $$ sink
    src $$ sinkHandle stdout

main :: IO ()
main = runTCPClient (ClientSettings 3001 "127.0.0.1") send
