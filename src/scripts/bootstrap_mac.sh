#!/usr/bin/env bash

# inspired by https://github.com/kentcdodds/dotfiles/blob/master/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

echo "Hello $(whoami)! Let's get you set up."

if [ $1 = "1" ] ; then
  slim=true
fi

if [[ "$slim" = "true" ]] ; then
  echo "running slim version"
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "installing homebrew"
# install homebrew https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "installing apps with brew cask"
brew install --cask alfred google-chrome spotify dropbox rectangle vlc grandperspective skitch notion
brew install bitwarden bitwarden-cli php mas

if [[ "$slim" != "true" ]] ; then
  echo "installing larger apps"
  brew install --cask vlc
fi

#: quicklook plugins: https://github.com/sindresorhus/quick-look-plugins
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize qlvideo

#: fix qlstephen permission issues
#: https://github.com/whomwah/qlstephen#permissions-quarantine
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
xattr -cr ~/Library/QuickLook/QLColorCode.qlgenerator
qlmanage -r
qlmanage -r cache

echo "making system modifications:"

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Mouse Settings
# enable secondary click
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
# swipe between pages
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 1

# Trackpad Settings
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Dock
defaults write com.apple.dock autohide -bool true

# allow apps downloaded from anywhere
sudo spctl --master-disable

echo "installing alfred plugins"
read -rsp $'Set up Alfred and then press any key to continue...\n' -n1 key

# install npm alfred packages
npm i -g alfred-dark-mode
npm i -g @stdavis/alfred-notion
