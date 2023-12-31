#!/usr/bin/env zsh

set -e

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${DOTFILES_LOCATION}/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

ln -sf "${DOTFILES_LOCATION}/iterm2/.hushlogin" "${HOME}/.hushlogin"