#!/usr/bin/env sh

set -e

DOTFILES_LOCATION=$(pwd)
export DOTFILES_LOCATION;
echo $DOTFILES_LOCATION

###
# Install all sub directories
###
./bin/dotfiles install aws
./bin/dotfiles install claude
./bin/dotfiles install git
./bin/dotfiles install iterm2
./bin/dotfiles install k9s
./bin/dotfiles install omz
./bin/dotfiles install vim
./bin/dotfiles install zsh