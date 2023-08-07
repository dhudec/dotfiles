#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/zsh/.zshrc" "${HOME}/.zshrc"
ln -sf "${DOTFILES_LOCATION}/zsh/.zprofile" "${HOME}/.zprofile"
ln -sf "${DOTFILES_LOCATION}/zsh/.p10k.zsh" "${HOME}/.p10k.zsh"