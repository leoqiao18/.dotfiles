#!/bin/sh

set -e

# can't run if not bash
if [ -n "$BASH_VERSION" ]; then
  echo
  echo "Must be using bash shell."
  echo

  exit 1;
fi

# important names
DOTFILES_DIR="$HOME/.dotfiles"
KEEP_BACKUP=false

Usage() {
  echo
  echo "usage: install.sh [options]"
  echo
  echo "options:"
  echo "-b	Keep backup files."
  echo "-h	Display usage."
  echo

  exit 0;
}

# parse options
while getopts 'b:h' opt; do
  case $opt in
    b)
	KEEP_BACKUP=true
        ;;
    h | *)
	Usage
	;;
  esac
done

CopyFile() {
  if [ $KEEP_BACKUP = true ]; then
    cp --backup $1 $2
  else
    cp $1 $2
  fi
}

Install() {
  sudo apt install $1
}

# initial setup
sudo apt update
sudo apt upgrade

# install some general packages
Install git
Install curl
Install wget
Install grep
Install make
Install cmake
Install build-essential

# oh-my-bash
if [ ! -d "$HOME/.oh-my-bash" ]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

# Editor: Vim
Install vim
CopyFile "${DOTFILES_DIR}/vim/vimrc.template" "$HOME/.vimrc"

# Tool: tmux
Install tmux
CopyFile "${DOTFILES_DIR}/tmux/tmux.conf.template" "$HOME/.tmux.conf.template"

# Language: C, C++
Install gcc

# Language: Ocaml

# Language: Haskell

# Language: Python 3
