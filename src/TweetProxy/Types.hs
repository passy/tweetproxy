{-# OPTIONS -Wall -fno-warn-missing-signatures #-}

module TweetProxy.Types where

data Config = Config {
    configListen :: Int,
    configKey :: String,
    configSecret :: String
}
