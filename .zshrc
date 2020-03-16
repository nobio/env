# ---------------------------------------------------
# aliasses
# ---------------------------------------------------
alias ll="ls -la"
alias vi="vim"

# ---------------------------------------------------
# colors...
# ---------------------------------------------------
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=LSCOLORS=dxfxcxdxbxegedabagacad

# ---------------------------------------------------
# git auto complete
# ---------------------------------------------------
autoload -Uz compinit && compinit

# ---------------------------------------------------
# prompt
# for colours try this:
#   for i in {1..256}; do print -P "%F{$i}Color : $i"; done;
# ---------------------------------------------------

setopt PROMPT_SUBST
#PROMPT='$(parse_git_branch)ś'
PS1=$'\e[0;31m%n\e[0;36m@%m\e[0;37m %~\e[0;33m$(parse_git_branch.sh) \e[0;32m▶\e[0m '

# PS1=$'\e[0;31m%n\e[0;36m@%m\e[0;37m %~ \e[0;32m %{git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'} ▶\e[0m '


#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
#zstyle ':vcs_info:git:*' formats '%b'


# ---------------------------------------------------
# nvm settings 
# ---------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
