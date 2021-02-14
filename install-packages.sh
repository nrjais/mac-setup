#!/usr/bin/env sh

export HOMEBREW_NO_AUTO_UPDATE=1

function update_brew() {
  brew update
  brew upgrade
}

update_brew
brew bundle --file=./mac-setup/Brewfile
