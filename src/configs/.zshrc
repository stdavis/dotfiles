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
alias pip='pip3'
alias ns='npm start'
alias nt='npm test'
alias zshconfig='vim ~/.zshrc'
alias sourcez='source ~/.zshrc'

# fnm
export PATH=/Users/scottdavis/.fnm:$PATH
eval "`fnm env`"

FNM_USING_LOCAL_VERSION=0

autoload -U add-zsh-hook
_fnm_autoload_hook () {
  if [[ -f .nvmrc && -r .nvmrc || -f .node-version && -r .node-version ]]; then
    FNM_USING_LOCAL_VERSION=1
    fnm use --install-if-missing
  elif [ $FNM_USING_LOCAL_VERSION -eq 1 ]; then
    FNM_USING_LOCAL_VERSION=0
    fnm use default --install-if-missing
  fi
}

add-zsh-hook chpwd _fnm_autoload_hook && _fnm_autoload_hook

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
#eval "$(direnv hook zsh)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/tools"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/scottdavis/Library/Python/3.9/bin:$PATH"

# gcloud shell completions
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
