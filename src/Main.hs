{-# OPTIONS -Wall #-}

module Main where

import System.Console.CmdArgs.Implicit (cmdArgs)
import TweetProxy.Options (options)

main :: IO ()
main = print =<< cmdArgs options
