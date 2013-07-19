{-# LANGUAGE PackageImports #-}
{-# OPTIONS -Wall -fno-warn-missing-signatures #-}
module TweetProxy.Config (getConfig) where

import "ConfigFile" Data.ConfigFile (readstring, emptyCP, get)
import TweetProxy.Types


getConfig :: FilePath -> IO Config
getConfig conf = do
    contents <- readFile conf
    let config = do
        c <- readstring emptyCP contents
        listen <- get c "LISTEN" "port"
        key <- get c "AUTH" "key"
        secret <- get c "AUTH" "secret"

        return Config {
            configListen = listen,
            configKey = key,
            configSecret = secret
        }

    case config of
        Left err -> error $ show err
        Right c -> return c
