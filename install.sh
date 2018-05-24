#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -nv true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

read waste
#Ask for name to use in oh my zsh
echo "Enter name to display in prompt"
read name

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew cask tap
brew cask upgrade

export HOMEBREW_NO_AUTO_UPDATE=1

brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

brew install ack
brew install git


echo $name | sh -c "$(curl -fsSL https://raw.githubusercontent.com/nrjais/oh-my-zsh/master/tools/install.sh)"

echo "Installing vim";
git clone --depth=1 https://github.com/nrjais/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install.sh

echo "Installing docker"
brew install docker
brew cask install docker

echo "Installing node, clojure";
brew install node
brew install leiningen

brew install wget

echo "Installing slack";
brew cask install slack

echo "Installing firefox";
brew cask install firefox

echo "Installing chrome";
brew cask install google-chrome

echo "Installing google drive";
brew cask install google-backup-and-sync

echo "Installing iterm2";
brew cask install iterm2

echo "Installing vlc";
brew cask install vlc

echo "Installing visual-studio-code";
brew cask install visual-studio-code

echo "Installing adobe reader";
brew cask install adobe-acrobat-reader

echo "Installing java";
brew cask install java

echo "Installing virtualbox and vagrant"
brew cask install virtualbox
brew cask install vagrant

#Cleanup
brew cleanup
brew cask cleanup
