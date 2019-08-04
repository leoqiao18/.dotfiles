#!/usr/bin/env bash

main() {
  if ./confirm.sh "Do you want to setup other configs (vim, tmux, etc...)? [y/N]"; then
    echo " * Setting up configs for:"
    echo "   > vim, tmux"

    vim_config
    tmux_config
  fi
}

vim_config() {
  if [[ -f "$HOME/.vimrc" ]]; then
    echo " ** '~/.vimrc' already exists"
  else
    echo " ** setup '~/.vimrc'"
    cp ./templates/vimrc ~/.vimrc
  fi
}

tmux_config() {
  if [[ -f "$HOME/.tmux.conf" ]]; then
    echo " ** '~/.tmux.conf' already exists"
  else
    echo " ** setup '~/.tmux.conf'"
    cp ./templates/tmux.conf ~/.tmux.conf
  fi
}

main
