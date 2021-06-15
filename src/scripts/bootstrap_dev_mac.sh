#!/usr/bin/env bash

if [ $1 = "1" ] ; then
  slim=true
fi

if [[ "$slim" = "true" ]] ; then
  echo "running slim version"
fi

# dev apps
echo "installing developer apps via brew"
brew install python zsh zsh-autosuggestions git inkscape dbeaver-community gh starship
brew install --cask visual-studio-code

if [[ "$slim" != "true" ]] ; then
  echo "installing larger apps"
  brew install --cask qgis
fi

# make zsh default shell
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "$SCRIPT_DIR/../configs/.zshrc"
ln -sfh "$SCRIPT_DIR/../configs/.zshrc" ~/.zshrc
mkdir ~/.config
ln -sfh "$SCRIPT_DIR/../configs/starship.toml" ~/.config/starship.toml

# fnm
echo "installing fnm"
curl -fsSL https://fnm.vercel.app/install | bash
fnm install --lts

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
