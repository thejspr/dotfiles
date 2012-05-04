export PATH=/usr/local/bin:~/bin:/usr/local/share/python:$PATH

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
export ZSH_THEME="thejspr"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# OFF
# zsh-syntax-highlighting
plugins=(git bundler osx brew history-substring-search gem)

source $ZSH/oh-my-zsh.sh

if [ -f ~/Code/dotfiles/_zshrc ]; then
  . ~/Code/dotfiles/_zshrc
fi

# Rbenv
if [[ -s "${HOME}/.rbenv/bin" ]]; then
    rbenv_root="${HOME}/.rbenv"
  else
rbenv_root="/usr/local/rbenv"
  export RBENV_ROOT="$rbenv_root"
fi

export PATH="${rbenv_root}/bin:$PATH"
eval "$(rbenv init -)"

unalias ruby
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
