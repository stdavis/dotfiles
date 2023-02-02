#!/usr/bin/env bash

if [ $1 = "1" ] ; then
  slim=true
fi

if [[ "$slim" = "true" ]] ; then
  echo "running slim version"
fi

# do this before installing the apps that use them
echo "creating symlinks to config files"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
sudo ln -sfh "$SCRIPT_DIR/../configs/.zshrc" ~/.zshrc
sudo mkdir ~/.config
sudo ln -sfh "$SCRIPT_DIR/../configs/starship.toml" ~/.config/starship.toml
sudo ln -sfh "$SCRIPT_DIR/../configs/.gitconfig" ~/.gitconfig

# dev apps
echo "installing developer apps via brew"
brew install python zsh zsh-autosuggestions git inkscape dbeaver-community gh starship wget watchman git-secrets gpg jq java ngroka git-lfs
brew install --cask visual-studio-code android-studio hyper insomnia kap

# java is keg-only so set up a symlink
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

if [[ "$slim" != "true" ]] ; then
  echo "installing larger apps"
  brew install --cask qgis
fi

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
brew install --cask font-fira-code font-fira-code-nerd-font font-victor-mono

echo "setting up key repeat for vscode"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

echo "updating keyboard settings"
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
