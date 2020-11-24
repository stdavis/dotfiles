bash ./bootstrap_mac.sh

# nvm
echo "installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install 'lts/*'
nvm alias default 'lts/*'

# dev apps
echo "installing developer apps via brew"
brew cask install visual-studio-code

echo "installing fonts"
brew tap homebrew/cask-fonts
brew cask install font-fira-code
