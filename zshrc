# zmodload zsh/zprof # uncomment for zsh startup testing `time  zsh -i -c exit`
eval "$(starship init zsh)"

export ZSH="${HOME}/.oh-my-zsh"
export NVM_LAZY_LOAD=true
plugins=(git history-substring-search zsh-autosuggestions zsh-syntax-highlighting zsh-peco-history zsh-nvm)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#586e75"
source $ZSH/oh-my-zsh.sh

export DESKTOP=true
source ~/code/dotfiles/zsh_mods
# zprof
