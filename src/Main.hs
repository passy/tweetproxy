{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# OPTIONS -Wall #-}

module Main where

import System.Console.CmdArgs.Implicit (cmdArgs)
import TweetProxy.Options (options, optionsConf)
import TweetProxy.Config (getConfig)
import TweetProxy.Types (Config(..))
import "http-types" Network.HTTP.Types (status200)
import "blaze-builder" Blaze.ByteString.Builder (fromByteString)
import qualified "warp" Network.Wai.Handler.Warp as Warp
import qualified "wai" Network.Wai as Wai


app :: Wai.Application
app _ = return $ Wai.ResponseBuilder
        status200 [("Content-Type", "text/plain"), ("Content-Length", "4")]
        $ fromByteString "Test"


start :: Config -> IO ()
start config = Warp.run (configListen config) app

main :: IO ()
main = cmdArgs options >>= getConfig . optionsConf >>= start
