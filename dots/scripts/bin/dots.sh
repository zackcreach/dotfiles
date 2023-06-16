#!/bin/bash

cd ~/dotfiles/
case $1 in
  install) brew bundle;;
  config) stow */ --no-folding;;
esac
