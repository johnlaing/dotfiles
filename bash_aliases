alias l="ls -al --color=auto --group-directories-first -h --time-style=+%Y-%m-%d\ %H:%M:%S"
alias rd="rdesktop -g workarea"
alias R="R --no-save --no-restore --silent"
alias pt="pstree -apsu"
alias findpg="find . -path ./.git -prune -o"

## local
[ -f ~/.bash_aliases.local ] && . ~/.bash_aliases.local
