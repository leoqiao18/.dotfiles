#!/usr/bin/env bash

main() {
  if ./confirm.sh "Do you want to setup ZSH? [y/N]"; then
    echo " * Installing oh-my-zsh..."
    if [[ "$DRY_RUN" = false ]]
    then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
  fi
}

main
