#!/usr/bin/env bash

# copied from https://github.com/kentcdodds/dotfiles/blob/master/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Hello $(whoami)! Let's get you set up."

echo "installing homebrew"
# install homebrew https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "installing apps with brew cask"
brew cask install alfred google-chrome visual-studio-code spotify dropbox

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
