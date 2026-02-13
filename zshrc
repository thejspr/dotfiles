[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
export PATH_TO_TOOLCHAIN="$HOME/clearhaus/pci-local-procesr-stack"
export ZSH="${HOME}/.oh-my-zsh"
plugins=(history-substring-search)
source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/dotfiles/zsh_mods
