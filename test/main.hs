module Main where

import Test.Hspec.Monadic

main = hspecX $ do
    describe "lol" $ do
        it "because 1 is 1" $ do
            1 == 1
