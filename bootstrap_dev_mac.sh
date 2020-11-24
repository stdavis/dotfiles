bash ./bootstrap_mac.sh

# nvm
echo "installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install 'lts/*'
nvm alias default 'lts/*'

# dev apps
echo "installing developer apps via brew"
brew install python zsh zsh-autosuggestions git
brew cask install visual-studio-code

# make zsh default shell
cp ./.zshrc ~/.zshrc
source ~/.zshrc
chsh -s /usr/local/bin/zsh

# oh my zsh
echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# spaceship prompt
npm install -g spaceship-prompt

echo "installing fonts"
brew tap homebrew/cask-fonts
brew cask install font-fira-code
