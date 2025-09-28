# ---------------------------------------------------
# aliasses
# ---------------------------------------------------
alias ll="ls -la"
alias l="ls -la"
alias vi="vim"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ".."="cd .."

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
__parse_git_branch() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    changed=$(git status 2> /dev/null | grep modified | wc -l)
    
    if [[ $changed -gt 0 ]]; then
      echo $branch\* 
    else
      echo $branch
    fi;
  fi;
}
PS1=$'\e[0;31m%n\e[0;36m@%m\e[0;37m %~\e[0;33m $(__parse_git_branch) \e[0;32m▶\e[0m '

# ---------------------------------------------------
# nvm settings
# ---------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
