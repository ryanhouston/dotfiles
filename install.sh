#!/usr/bin/env sh

set -e
set -x

stow ack-grep
stow bin
stow dircolors
stow git
stow irssi
stow ruby
stow teamocil
stow tmux

if test -e ~/.zshrc; then
  mv ~/.zshrc ~/.zshrc.pre-dotfiles
fi
stow zsh

