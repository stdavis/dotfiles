#!/usr/bin/env bash

echo "updating xcode command line tools"
softwareupdate --all --install --force

echo "updating homebrew and packages"
export ACCEPT_EULA=y
brew update
brew upgrade --greedy
brew upgrade --cask --greedy
brew cleanup

if [ -x "$(command -v fnm)" ]; then
  echo "updating node/npm to LTS via fnm"
  fnm install --lts
fi

echo "upgrading npm"
npm i -g npm

if [ -x "$(command -v gcloud)" ]; then
  echo "updating gcloud"
  gcloud components update --quiet
fi

echo "updating mac app store apps"
mas upgrade
