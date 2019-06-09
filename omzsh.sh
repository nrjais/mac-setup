#!/usr/bin/env sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ./mac-setup/zshrc ~/.zshrc

sed -i '' "s/NAME_TO_DISPLAY/$NAME_TO_DISPLAY/" ~/.zshrc

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

brew install autojump
brew install zsh-syntax-highlighting

echo '***********************************************************'
echo 'Change your terminal font to hack-nerd-font in preferences'
echo '***********************************************************'
