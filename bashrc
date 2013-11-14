[ -f ~/.bash_aliases ] && . ~/.bash_aliases

umask 0002

export NETRC=/home/jlaing/.netrc
export EDITOR=/usr/bin/vim

alias tmux="tmux -2"
export TERM="screen-256color"
eval `dircolors ~/.colors/dircolors-solarized/dircolors.256dark`

## local
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
