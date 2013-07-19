{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# OPTIONS -Wall #-}

module Main where

import System.Console.CmdArgs.Implicit (cmdArgs)
import TweetProxy.Options (options, optionsConf)
import TweetProxy.Config (getConfig)
import TweetProxy.Types (Config(..))

import Yesod


data Proxy = Proxy {
    consumerKey :: String,
    consumerSecret :: String
}

mkYesod "Proxy" [parseRoutes|
    / RootR GET
|]

instance Yesod Proxy


getRootR :: Handler Html
getRootR = do
    yesod <- getYesod
    defaultLayout [whamlet|
        $doctype 5
        <h1>Hello World
        <h2>Consumer Key: #{consumerKey yesod}
    |]


start :: Config -> IO ()
start config = do
    let app = Proxy (configKey config) (configSecret config)
    warp (configListen config) app


main :: IO ()
main = cmdArgs options >>= getConfig . optionsConf >>= start
