read name

sudo -s

echo "Installing homebrew";
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

export HOMEBREW_NO_AUTO_UPDATE=1

echo $name | sh -c "$(curl -fsSL https://raw.githubusercontent.com/nrjais/oh-my-zsh/develop/tools/install.sh)"

echo "Installing vim";
git clone --depth=1 https://github.com/nrjais/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install.sh

echo "Installing node, clojure";

brew install node
brew install leiningen

brew install wget
brew cask tap

echo "Installing slack";
brew cask install slack

echo "Installing firefox";
brew cask install firefox

echo "Installing chrome";
brew cask install google-chrome

echo "Installing google drive";
brew cask install google-backup-and-sync

echo "Installing dropbox";
brew cask install dropbox

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


echo "Installing mocha";
npm i -g mocha

echo "Installing nodemon";
npm i -g nodemon
