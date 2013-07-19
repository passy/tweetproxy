# tweetproxy

## WORK IN PROGRESS

An authenticated Twitter API proxy in Haskell.

## WTF is this?

This is just me failing in public building some sort of a RESTful API thingy in
Haskell. I just like to Share All The Things™.

## Building

```
cabal install --dependencies-only
cabal configure
cabal build

dist/build/tweetproxy/tweetproxy --config=tweetproxy.conf.example
```
