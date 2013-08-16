#!/bin/sh

## make sure we call this script from inside the dotfiles directory
## doing otherwise makes a big mess
if [ $0 != "./install.sh" ]; then
  echo "must be in dotfiles directory to install"
  exit 1
fi

## install script borrowed from thoughtbot (initially, anyway)
## https://github.com/thoughtbot/dotfiles/blob/master/install.sh
install() {
  BASE="$1"
  for name in "$BASE"*; do
    target="$HOME/.$name"
    if [ "$name" = 'install.sh' ] || [ "$name" = 'README.md' ] || [ -L "$target" ]; then
      ## nothing: ignore
      echo -n ""
    elif [ ! -e "$target" ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    elif [ -d "$name" ]; then
      echo "Recursing into $name/"
      install "$name/"
    else
      echo "WARNING: $target exists but is not a symlink or a directory."
    fi
  done
}

install
