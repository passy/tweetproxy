{-# LANGUAGE OverloadedStrings, PackageImports, DataKinds #-}
{-# OPTIONS -Wall #-}

module Main where

import System.Console.CmdArgs.Implicit (cmdArgs)
import TweetProxy.Options (options, optionsConf)
import TweetProxy.Config (getConfig)
import TweetProxy.Types (Config, configListen, configHostname)

import "http-types" Network.HTTP.Types (status200)
import "wai" Network.Wai (Application, responseLBS)
import "warp" Network.Wai.Handler.Warp (Settings, runSettings, settingsHost,
                                        settingsPort, defaultSettings)
import "network-conduit" Data.Conduit.Network (HostPreference(..))


app :: Application
app _ = return $ responseLBS status200 [("Content-Type", "text/plain")] "Hullo World"


makeSettings :: Config -> Settings
makeSettings config = defaultSettings {
    settingsPort = configListen config,
    settingsHost = Host $ configHostname config
}

start :: Config -> IO ()
start config = runSettings (makeSettings config) app


main :: IO ()
main = cmdArgs options >>= getConfig . optionsConf >>= start
