# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
export ZSH_THEME="thejspr"

# OFF: vi-mode
plugins=(git bundler brew heroku redis-cli history-substring-search gem)

source $ZSH/oh-my-zsh.sh

# disable terminal locking
stty -ixon -ixoff

unsetopt correct_all

# Rbenv
if [[ -s "${HOME}/.rbenv/bin" ]]; then
  rbenv_root="${HOME}/.rbenv"
else
  rbenv_root="/usr/local/rbenv"
  export RBENV_ROOT="$rbenv_root"
fi

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/Applications/Postgres.app/Contents/MacOS/bin:${rbenv_root}/bin:$PATH
eval "$(rbenv init - --no-rehash)"

# ruby
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
export RBX_ROOT=$HOME/.rbenv/versions/rbx-2.0.0-dev
export RBXOPT=-X19

unalias rake
unalias ruby

# Work
if [ -f ~/.beh_ec2_auth ]; then
  . ~/.beh_ec2_auth
fi
export SKIP_COVERAGE=true
export PROFILE=default

# https://github.com/rupa/z
 . `brew --prefix`/etc/profile.d/z.sh
 function precmd () {
  z --add "$(pwd -P )"
 }

# Alias and function definitions.
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
if [ -f ~/.functions ]; then
  . ~/.functions
fi

# Clojure
if [[ ! $CLASSPATH == *clojure-contrib* ]]; then
  export CLASSPATH=/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
  # export CLASSPATH=/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar:$CLASSPATH
fi

__git_files () {
  _wanted files expl ‘local files’ _files
}
