#!/bin/sh

## make sure we call this script from inside the dotfiles directory
## doing otherwise makes a big mess
if [ $0 != "./install.sh" ]; then
  echo "must be in dotfiles directory to install"
  exit 1
fi

## install script borrowed from thoughtbot
## https://github.com/thoughtbot/dotfiles/blob/master/install.sh
for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done
