#!/usr/bin/env sh

set -e
set -x

stow_home() {
  stow $1 --target=$HOME
}

resolve_conflict() {
  if test -e $1; then
    mv $1 $1.pre-dotfiles
  fi
}

stow_home ack-grep
stow_home alacritty
stow_home bin
stow_home git
stow_home tmux
stow_home postgresql

resolve_conflict ~/.zshrc
stow_home zsh
