#!/usr/bin/env zsh

set -e

# Ensure ~/.claude directory exists
mkdir -p "${HOME}/.claude"

ln -sf "${DOTFILES_LOCATION}/claude/CLAUDE.md" "${HOME}/.claude/CLAUDE.md"
ln -sf "${DOTFILES_LOCATION}/claude/settings.json" "${HOME}/.claude/settings.json"
ln -sf "${DOTFILES_LOCATION}/claude/settings.local.json" "${HOME}/.claude/settings.local.json"

# Symlink agents directory (remove existing directory if needed)
rm -rf "${HOME}/.claude/agents"
ln -sf "${DOTFILES_LOCATION}/claude/agents" "${HOME}/.claude/agents"
