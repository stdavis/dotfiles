bash ./bootstrap_mac.sh

#: install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# dev apps
echo "installing developer apps via brew"
brew cask install visual-studio-code

echo "installing fonts"
brew tap homebrew/cask-fonts
brew cask install font-fira-code
