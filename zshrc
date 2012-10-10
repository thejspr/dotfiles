# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
export ZSH_THEME='agnoster'
export DEFAULT_USER='jesper'

# OFF: vi-mode
plugins=(git bundler brew heroku history-substring-search gem)

source $ZSH/oh-my-zsh.sh

# disable terminal locking
stty -ixon -ixoff

unsetopt correct_all

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/Applications/Postgres.app/Contents/MacOS/bin:~/.rbenv/bin:$PATH
eval "$(rbenv init - --no-rehash)"

# Ruby
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
unalias rake
unalias ruby

# Work
if [ -f ~/.beh_ec2_auth ]; then
  . ~/.beh_ec2_auth
fi
export SKIP_COVERAGE=true
export CI=false
export PROFILE=default

# https://github.com/rupa/z
. `brew --prefix`/etc/profile.d/z.sh

# Alias and function definitions.
. ~/.aliases
# . ~/.functions
