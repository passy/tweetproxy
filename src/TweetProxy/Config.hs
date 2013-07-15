{-# LANGUAGE PackageImports #-}
{-# OPTIONS -Wall -fno-warn-missing-signatures #-}
module TweetProxy.Config (getConfig) where

import "ConfigFile" Data.ConfigFile (readstring, emptyCP, get)
import Data.Word (Word16)
import TweetProxy.Types


getConfig :: FilePath -> IO Config
getConfig conf = do
    contents <- readFile conf
    let config = do
        c <- readstring emptyCP contents
        listen <- get c "LISTEN" "port"

        return Config {
            configListen = fromIntegral (listen::Word16)
        }

    case config of
        Left err -> error $ show err
        Right c -> return c
