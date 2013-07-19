{-# LANGUAGE PackageImports #-}
{-# OPTIONS -Wall -fno-warn-missing-signatures #-}

module TweetProxy.Types where

data Config = Config {
    configListen :: Int --,
    -- configHostname :: String,
    -- configKey :: String,
    -- configSecret :: String
}
