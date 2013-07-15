{-# OPTIONS -Wall #-}

module Main where

import System.Console.CmdArgs.Implicit (cmdArgs)
import TweetProxy.Options (options, optionsConf)
import TweetProxy.Config (getConfig)
import TweetProxy.Types (configListen)


main :: IO ()
main = cmdArgs options >>= getConfig . optionsConf >>= (print . configListen)
