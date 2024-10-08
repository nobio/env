# ---------------------------------------------------
# aliasses
# ---------------------------------------------------
alias ll="ls -la"
alias vi="vim"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# ---------------------------------------------------
# git auto complete
# ---------------------------------------------------
autoload -Uz compinit && compinit

# ---------------------------------------------------
# colors...
# ---------------------------------------------------
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=LSCOLORS=dxfxcxdxbxegedabagacad

# ---------------------------------------------------
# prompt
# for colours try this:
#   for i in {1..256}; do print -P "%F{$i}Color : $i"; done;
# ---------------------------------------------------setopt PROMPT_SUBST
setopt PROMPT_SUBST
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1=$'\e[0;31m%n\e[0;36m@%m\e[0;37m %~\e[0;33m$(parse_git_branch) \e[0;32m▶\e[0m '

# ---------------------------------------------------
# nvm settings
# ---------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
