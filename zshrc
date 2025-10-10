# zmodload zsh/zprof # uncomment for zsh startup testing `time  zsh -i -c exit`
[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"

export ZSH="${HOME}/.oh-my-zsh"
plugins=(git history-substring-search gpg-agent)
source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="$HOME/.local/share/omarchy/bin:$PATH"

source ~/dotfiles/zsh_mods
# zprof

alias claude="/home/jk/.claude/local/claude"
