export PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="thejspr"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# OFF
# zsh-syntax-highlighting
plugins=(git bundler osx brew history-substring-search gem pow)
if [ "$HOST" = "theprogress" ]; then; plugins=(git rvm); fi

source $ZSH/oh-my-zsh.sh

if [ -f ~/Code/dotfiles/_zshrc ]; then
  . ~/Code/dotfiles/_zshrc
fi

# rbenv
eval "$(rbenv init -)"

unalias ruby
