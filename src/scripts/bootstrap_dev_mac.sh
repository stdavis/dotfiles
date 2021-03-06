#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if [ $1 = "1" ] ; then
  slim=true
fi

if [[ "$slim" = "true" ]] ; then
  echo "running slim version"
fi

# dev apps
echo "installing developer apps via brew"
brew install python zsh zsh-autosuggestions git inkscape dbeaver-community gh starship wget
brew install --cask visual-studio-code

if [[ "$slim" != "true" ]] ; then
  echo "installing larger apps"
  brew install --cask qgis
fi

# make zsh default shell
echo "creating symlinks to config files"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ln -sfh "$SCRIPT_DIR/../configs/.zshrc" ~/.zshrc
mkdir ~/.config
ln -sfh "$SCRIPT_DIR/../configs/starship.toml" ~/.config/starship.toml
ln -sfh "$SCRIPT_DIR/../configs/.gitconfig" ~/.gitconfig

# fnm
if [[ -z "$FNM_DIR" ]] ; then
  echo "installing fnm"
  curl -fsSL https://fnm.vercel.app/install | bash
  fnm install --lts
fi

# oh my zsh
if [[ -z "$ZSH" ]] ; then
  echo "installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

source ~/.zshrc
chsh -s /usr/local/bin/zsh

echo "installing fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code font-fira-code-nerd-font

echo "setting up key repeat for vscode"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
