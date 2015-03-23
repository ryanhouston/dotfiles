#!/usr/bin/env sh

set -e
set -x

stow_home () {
  stow $1 --target=$HOME
}

stow_home ack-grep
stow_home ack-grep
stow_home bin
stow_home dircolors
stow_home git
stow_home irssi
stow_home ruby
stow_home teamocil
stow_home tmux

if test -e ~/.zshrc; then
  mv ~/.zshrc ~/.zshrc.pre-dotfiles
fi
stow_home zsh

