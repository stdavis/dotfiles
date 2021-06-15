export GIT_EDITOR=vim
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"

# https://github.com/zsh-users/zsh-autosuggestions#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh

# starship
eval "$(starship init zsh)"

# my aliases
alias python='python3'

alias ns='npm start'

alias zshconfig='vim ~/.zshrc'
alias sourcez='source ~/.zshrc'

# fnm
export PATH=/Users/stdavis/.fnm:$PATH
eval "`fnm env`"
