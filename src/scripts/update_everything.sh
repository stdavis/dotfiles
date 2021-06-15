#!/usr/bin/env bash

echo "updating homebrew and packages"
brew update
brew upgrade
brew upgrade --cask

echo "updating node/npm to LTS"
nvm install "lts/*" --reinstall-packages-from=default --latest-npm
nvm alias default "lts/*"

echo "updating gcloud"
gcloud components update --quiet
