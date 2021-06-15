#!/usr/bin/env bash

echo "installing NodeJs"
cd ~/Downloads
mkdir nodejs
cd nodejs
curl "https://nodejs.org/dist/node-latest.tar.gz" | tar xz --strip-components=1
./configure --prefix=~/local
make install

echo "installing npm"
curl https://www.npmjs.org/install.sh | sh

echo "installing dotfiles"
npm i -g @stdavis/dotfiles
