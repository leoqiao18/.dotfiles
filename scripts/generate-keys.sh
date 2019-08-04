#!/usr/bin/env bash

main() {
  if ./confirm.sh "Do you want to setup SSH keys? [y/N]"; then
    echo " * Setting up SSH keys"
    if ssh_exists; then
      echo " **You already have SSH keys setup in '~/.ssh'"
    else
      setup_ssh
    fi
    copy_public_key
  fi
}

copy_public_key() {
  if command_exists pbcopy; then
    pbcopy < ~/.ssh/id_rsa.pub
    echo ""
    echo -e "\033[1;32mWe've copied this key to your clipboard. Please paste it to the 'Add SSH Key' page Github we will open after you press ENTER: \033[0m"
    read
    open 'https://github.com/settings/ssh/new'
  fi
}

command_exists() {
  # $1: command name to test existence
  type "$1" > /dev/null
}

ssh_exists() {
  [[ -d "$HOME/.ssh" && -f "$HOME/.ssh/id_rsa" && -f "$HOME/.ssh/id_rsa.pub" ]]
}

setup_ssh() {
  echo " ** Let's start by generating a new pair of SSH keys..."
  echo " \/ To generate the keys, please provide your email address or just press ENTER to skip:"
  read email_address

  if [[ ! -z "$email_address" ]] && [[ "$DRY_RUN" = false ]]; then
    ssh-keygen -t rsa -b 4096 -q -N "" -C "$email_address"
  fi
}

main
