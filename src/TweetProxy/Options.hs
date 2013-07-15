{-# LANGUAGE DeriveDataTypeable, ScopedTypeVariables #-}
{-# OPTIONS -Wall -fno-warn-missing-signatures #-}
module TweetProxy.Options (Options, options, optionsConf) where

import System.Console.CmdArgs


data Options = Options {
    conf :: FilePath
} deriving (Show, Data, Typeable)


options = Options
    { conf = def &= opt "tweetproxy.conf" &= help "Configuration file." }
    &= summary "TweetProxy (C) Pascal Hartig 2013"
    &= help "Runs an authenticated API proxy for the Twitter API."

optionsConf = conf
