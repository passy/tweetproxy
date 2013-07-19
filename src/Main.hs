{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS -Wall #-}

module Main where

import System.Console.CmdArgs.Implicit (cmdArgs)
import TweetProxy.Options (options, optionsConf)
import TweetProxy.Config (getConfig)
import TweetProxy.Types (Config, configListen)

import Network.HTTP.Types (status200)
import Network.Wai (Application, responseLBS)
import Network.Wai.Handler.Warp (run)
import qualified Data.ByteString as B


app :: Application
app req = return $ responseLBS status200 [("Content-Type", "text/plain")] "Hullo World"


start :: Config -> IO ()
start config = run (configListen config) app


main :: IO ()
main = cmdArgs options >>= getConfig . optionsConf >>= start
