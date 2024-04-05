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
alias nb='npm run build'
alias nsb='npm run storybook'
alias npck='npx npm-check-updates --color --interactive --format group,repo'
alias zshconfig='vim ~/.zshrc'
alias sourcez='source ~/.zshrc'
alias gfd='git switch main && git pull && git branch -D dev && git switch -c dev'
alias gf='git switch main && git pull && git branch'
alias honeycomb='~/bin/honeycomb.sh'

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
alias tfa='noglob terraform apply'
alias tfdev='terraform workspace select dev'
alias tfi='terraform init'
alias tfp='noglob terraform plan'
alias tfprod='terraform workspace select prod'
alias tfwdev='terraform workspace new dev'
alias tfwprod='terraform workspace new prod'

# android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# direnv - required for working on expo/expo repo
#eval "$(direnv hook zsh)"

# gcloud shell completions
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
eval
EAS_AC_ZSH_SETUP_PATH=/Users/scottdavis/Library/Caches/eas-cli/autocomplete/zsh_setup && test -f $EAS_AC_ZSH_SETUP_PATH && source $EAS_AC_ZSH_SETUP_PATH; # eas autocomplete setup

# gcloud compute ssh
export CLOUDSDK_PYTHON_SITEPACKAGES=1

# required for node-gyp (npm installs)
export PYTHON=/usr/local/bin/python3

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# personal commands
export PATH="$PATH:$HOME/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/tools"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/scottdavis/Library/Python/3.10/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/scottdavis/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
