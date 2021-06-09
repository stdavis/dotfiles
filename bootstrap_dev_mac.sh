bash ./bootstrap_mac.sh

# fnm
echo "installing fnm"
curl -fsSL https://fnm.vercel.app/install | bash
fnm install --lts

# dev apps
echo "installing developer apps via brew"
brew install python zsh zsh-autosuggestions git inkscape dbeaver-community gh starship
brew install --cask visual-studio-code qgis adoptopenjdk

# make zsh default shell
cp ./.zshrc ~/.zshrc
source ~/.zshrc
chsh -s /usr/local/bin/zsh

# TODO: copy .config/starship.toml and any others.

# oh my zsh
echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code font-fira-code-nerd-font

echo "setting up key repeat for vscode"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
