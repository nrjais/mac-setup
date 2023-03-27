#!/usr/bin/env sh

# Ask for the administrator password upfront.
sudo -v

set -e

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -nv true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#Install brew packages and casks
./mac-setup/install-packages.sh

#Cleanup
brew cleanup
rm -rf mac-setup
