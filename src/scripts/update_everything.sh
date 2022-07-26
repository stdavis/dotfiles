#!/usr/bin/env bash

echo "updating xcode command line tools"
softwareupdate --all --install --force

echo "updating homebrew and packages"
export ACCEPT_EULA=y
brew update
brew upgrade --greedy
brew upgrade --cask --greedy

echo "updating node/npm to LTS"
fnm install --lts
npm i -g npm

echo "updating gcloud"
gcloud components update --quiet

echo "updating mac app store apps"
mas upgrade
