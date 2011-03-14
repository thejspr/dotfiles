# specific things for laptop and server
if [ "$HOST" = "ub" ]; then
  export CDPATH=.:~:~/Dropbox/:~/Dropbox/projects
  export PATH=${PATH}:/home/jesper/apps/android-sdk-linux_x86/tools
  # https://github.com/rupa/z
  . ~/repos/z/z.sh
  function precmd () {
    z --add "$(pwd -P)"
  }
else
	cd /var/www/
fi

# Alias and function definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt walters

#-----------------------------------
# SSH agent init
#-----------------------------------
SSH_ENV="$HOME/.ssh/environment"
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cygwin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
  }
fi
