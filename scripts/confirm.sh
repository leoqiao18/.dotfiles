#!/usr/bin/env bash

# call with a prompt string or use a default
read -r -p "${1:-Are you sure? [y/N]} " response
case "$response" in
  [yY][eE][sS]|[yY])
    exit 0
    ;;
  *)
    exit 1
    ;;
esac
