export GIT_EDITOR=vim
export PATH="/usr/local/opt/ruby/bin:$PATH"

# ZSH
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

# terraform
function terratoken () {
  export GOOGLE_OAUTH_ACCESS_TOKEN="$(gcloud auth print-access-token)"
}
alias tf=terraform
alias tfa='terraform apply'
alias tfw='terraform workspace'

# android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# direnv - required for working on expo/expo repo
eval "$(direnv hook zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/tools"
