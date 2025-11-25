# zmodload zsh/zprof # uncomment for zsh startup testing `time  zsh -i -c exit`
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export PATH_TO_TOOLCHAIN="$HOME/clearhaus/pci-local-procesr-stack"
export ZSH="${HOME}/.oh-my-zsh"
plugins=(git history-substring-search gpg-agent)
source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/dotfiles/zsh_mods
# zprof
