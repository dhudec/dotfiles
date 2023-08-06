#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/aws/config" "${HOME}/.aws/config"
ln -sf "${DOTFILES_LOCATION}/aws/credentials" "${HOME}/.aws/credentials"