# prompt
PROMPT='%{$fg[green]%}%30<...<%~%<<%{$reset_color%} %(!.#.>) '
RPROMPT='$(git_prompt_info)'

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[gray]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
