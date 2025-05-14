export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias k="kubectl"
alias cls="clear"
export EDITOR="vim"
export K9S_SKIN="$HOME/.k9s/skin.yml"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
