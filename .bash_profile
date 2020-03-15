# export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLICOLOR=LSCOLORS=dxfxcxdxbxegedabagacad

# aliases
alias cd..="cd .."
alias l="ls -al"
alias ll='ls -lah'
alias lp="ls -p"
alias h=history

# the "kp" alias ("que pasa"), in honor of tony p.
alias kp="ps auxwww"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# prompt
export PS1="\[\033[0;31m\]\[\033[0m\033[0;31m\]\u\[\033[0;36m\]@\[\033[0;36m\]\h \033[0;37m\]\w\[\033[0;32m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\[\033[0;32m\]\[\033[0m\033[0;32m\]\[\033[0m\033[0;32m\] ▶\[\033[0m\] "
