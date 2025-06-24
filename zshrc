# zmodload zsh/zprof # uncomment for zsh startup testing `time  zsh -i -c exit`
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

export ZSH="${HOME}/.oh-my-zsh"
plugins=(git history-substring-search zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export DESKTOP=true
source ~/code/dotfiles/zsh_mods
# zprof
