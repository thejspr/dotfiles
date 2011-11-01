export PATH=/usr/local/bin:$HOME/.rbenv/bin:$PATH
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="gallois"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
if [ "$HOST" = "vision" ]; then
  plugins=(git github extract rvm heroku)
elif [ "$HOST" = "theprogress" ]; then
  plugins=(git rails3 rvm)
fi

source $ZSH/oh-my-zsh.sh

if [ -f ~/dotfiles/_zshrc ]; then
    . ~/dotfiles/_zshrc
fi

# rbenv
eval "$(rbenv init -)"
