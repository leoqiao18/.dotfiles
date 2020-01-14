#!/usr/bin/env bash

main() {
  if ./confirm.sh "Do you want to setup other configs (vim, tmux, etc...)? [y/N]"; then
    echo " * Setting up configs for:"
    echo "   > vim, tmux"

    vim_config
    tmux_config
    git_config
    git_ignore
  fi
}

vim_config() {
  if [[ -f "$HOME/.vimrc" ]]; then
    echo " ** '~/.vimrc' already exists"
  else
    echo " ** setup '~/.vimrc'"
    cp ../vim/vimrc.template ~/.vimrc
  fi
}

tmux_config() {
  if [[ -f "$HOME/.tmux.conf" ]]; then
    echo " ** '~/.tmux.conf' already exists"
  else
    echo " ** setup '~/.tmux.conf'"
    cp ../tmux/tmux.conf.template ~/.tmux.conf
  fi
}

git_config() {
  if [[ -f "$HOME/.gitconfig" ]]; then
    echo " ** '~/.gitconfig' already exists"
  else
    echo " ** setup '~/.gitconfig'"
    cp ../git/gitconfig.template ~/.gitconfig
  fi
}

git_ignore() {
  if [[ -f "$HOME/.gitignore" ]]; then
    echo " ** '~/.gitignore' already exists"
  else
    echo " ** setup '~/.gitignore'"
    cp ../git/gitignore.template ~/.gitignore
  fi
}

main
