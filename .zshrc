alias python='python3'

export GIT_EDITOR=vim
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/stdavis/.oh-my-zsh"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add nvm zsh hook
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# https://github.com/zsh-users/zsh-autosuggestions#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# my aliases
alias ns='npm start'
alias zshconfig='vim ~/.zshrc'
alias g='grunt'
alias sourcez='source ~/.zshrc'
