#!/usr/bin/env bash

main() {
  clear
  cat ./banner.txt

  arg="$1"
  if [[ "$arg" = "--dry" ]]
  then
    export DRY_RUN=true
    echo "This is a dry run, nothing will be installed"
  else
    export DRY_RUN=false
  fi

  ./generate-keys.sh
  ./configs.sh
  ./zsh.sh

  echo "All done!"
}

main
