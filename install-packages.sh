#!/usr/bin/env sh

failed_packages=()
failed_casks=()
failed_casks_and_packages=()

export HOMEBREW_NO_AUTO_UPDATE=1

function update_brew(){
  brew update
  brew upgrade

  brew tap caskroom/versions
  brew cask upgrade
}

function install_p() {
  if brew install $1; then
    echo "Successfully Install $1"
  else
    echo "Failed to install $1"
    return 1
  fi
}

function install_packages_from() {
  for package in $(cat $1); do
    install_p "$package"
    if [[ 1 -eq $? ]]; then
      failed_packages+=("$package")
    fi
  done
}

function install_cask(){
  if brew cask install $1; then
    echo "Successfully Install $1"
  else
    echo "Failed to install $1"
    return 1
  fi
}

function install_casks_from() {
  for package in $(cat $1); do
    install_cask "$package"
    if [[ 1 -eq $? ]]; then
      failed_casks+=("$package")
    fi
  done
}

function retry_failed_packages(){
  for package in "${failed_packages[@]}"; do
    echo "Retrying installation of $package"
    install_p "$package"
    if [[ 1 -eq $? ]]; then
      failed_casks_and_packages+=("$package")
    fi 
  done
}

function retry_failed_casks(){
  for package in "${failed_casks[@]}"; do
    echo "Retrying installation of $package"
    install_cask "$package"
    if [[ 1 -eq $? ]]; then
      failed_casks_and_packages+=("$package")
    fi 
  done
}

function list_failed_casks_and_packages(){
  echo "${failed_casks_and_packages[@]}" > failed_packages.txt
  echo "${failed_casks_and_packages[@]}"
}

update_brew
install_packages_from ./mac-setup/brew-packages.txt
install_casks_from ./mac-setup/brew-cask-packages.txt
retry_failed_packages
retry_failed_casks
list_failed_casks_and_packages
