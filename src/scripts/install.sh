#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

echo "installing Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "installing wget"
brew install wget

echo "installing nodejs"
curl "https://nodejs.org/dist/latest/node-${VERSION:-$(wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}.pkg" > "$HOME/Downloads/node-latest.pkg"
sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"

echo "installing npm"
curl https://www.npmjs.org/install.sh | sh

echo "update permissions for global node_modules"
sudo chown -R $USER /usr/local/lib/node_modules

echo "installing dotfiles"
npm i -g @stdavis/dotfiles
