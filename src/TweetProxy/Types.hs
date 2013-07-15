{-# LANGUAGE PackageImports #-}
{-# OPTIONS -Wall -fno-warn-missing-signatures #-}

module TweetProxy.Types where

import "network" Network.Socket.Internal (PortNumber)

data Config = Config {
    configListen :: PortNumber--,
    -- configHostname :: String,
    -- configKey :: String,
    -- configSecret :: String
}
