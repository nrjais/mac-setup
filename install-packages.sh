#!/usr/bin/env bash

brew install $(cat brew-packages.txt)
brew cask install $(cat brew-cask-packages.txt)
