{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Conduit
import Data.Conduit.Network

echo :: Application IO
echo src sink = src $$ sink

main :: IO ()
main = runTCPServer (ServerSettings 3001 "127.0.0.1") echo
