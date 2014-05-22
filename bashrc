[ -f ~/.bash_aliases ] && . ~/.bash_aliases

umask 0002

export NETRC=/home/jlaing/.netrc
export EDITOR=/usr/bin/vim

alias tmux="tmux -2"
export TERM="screen-256color"
eval `dircolors ~/.colors/dircolors-solarized/dircolors.256dark`
tmirr() {
  tmux has-session -t "$1" || return
  for i in $(seq 1 9); do
    newsess="$1-mirr$i"
    tmux has-session -t "$newsess" 2> /dev/null
    if [ $? -eq 1 ]; then
      tmux new-session -s "$newsess" -t "$1"
      return
    fi
  done
  echo "all mirrors already exist"
  return 1
}

## local
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
