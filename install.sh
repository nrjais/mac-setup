#!/usr/bin/env sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -nv true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Ask for name to use in oh my zsh
echo "

Enter name to display in prompt"

read name
while [ -z "$name" ]
do
  read name
done

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo $name | sh -c "$(curl -fsSL https://raw.githubusercontent.com/nrjais/oh-my-zsh/master/tools/install.sh)"

echo "Installing vim";
git clone --depth=1 https://github.com/nrjais/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install.sh
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Clone setup scripts
git clone https://github.com/nrjais/mac-setup
sh ./mac-setup/install-packages.sh
rm -rf mac-setup
######################

#Cleanup
brew cleanup
