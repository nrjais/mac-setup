#!/usr/bin/env sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -nv true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

function read_name_for_omzsh() {
  read NAME
  while [ -z "$NAME" ]
  do
    read NAME
  done

  echo $NAME
}

function print_msg(){
  echo "\n\nEnter name to display in prompt\n"
}

#Ask for name to use in oh my zsh if OMZSH is 1
[[ "$OMZSH" ]] && print_msg && NAME=$(read_name_for_omzsh)

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Install oh my zsh if OMZSH is 1
[[ "$OMZSH" ]] && echo $NAME | sh -c "$(curl -fsSL https://raw.githubusercontent.com/nrjais/oh-my-zsh/master/tools/install.sh)"

echo "Installing vim";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nrjais/vimrc/master/install.sh)"

#Install brew packages and casks
./mac-setup/install-packages.sh

#Cleanup
brew cleanup
rm -rf mac-setup
