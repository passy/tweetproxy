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


data Proxy = Proxy {
    consumerKey :: String,
    consumerSecret :: String
}

start :: Config -> IO ()
start config = do
    let app = Proxy (configKey config) (configSecret config)
    Warp.run (configListen config) $ const $ return $ Wai.ResponseBuilder
        status200 [("Content-Type", "text/plain"), ("Content-Length", "4")]
        $ fromByteString "Test"

main :: IO ()
main = cmdArgs options >>= getConfig . optionsConf >>= start
