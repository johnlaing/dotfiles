[ -f ~/.aliases ] && . ~/.aliases

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

sqld() {
  if [ $# -lt 2 ]; then
    echo "usage: sqld <file> <table> [db args]"
    return 1;
  fi
  local FILE="$1"; shift
  local TABLE="$1"; shift

  local COLS="$(head -1 $FILE | sed 's/\./_/g')"
  psql $* -c "copy $TABLE ($COLS) from stdin with csv header" < $FILE
}

## local
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
