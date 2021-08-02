#!/usr/bin/env bash

echo "updating xcode command line tools"
softwareupdate --all --install --force

echo "updating homebrew and packages"
brew update
brew upgrade
brew upgrade --cask

echo "updating node/npm to LTS"
fnm install --lts
npm i -g npm

echo "updating gcloud"
gcloud components update --quiet
