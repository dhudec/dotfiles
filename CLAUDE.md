# Dotfiles Repository

Personal dotfiles for bootstrapping a macOS development workstation.

## Purpose

This repo configures shell environments and developer tooling via symlinks to `$HOME`. Run `./install.sh` to install all modules, or install individually with `./bin/dotfiles install <module>`.

## Structure

```
dotfiles/
├── install.sh           # Main installer - runs all modules
├── bin/dotfiles         # CLI wrapper for per-module installs
├── aws/                 # AWS CLI config and credentials templates
├── git/                 # Git configuration
├── iterm2/              # iTerm2 preferences + One Dark theme
├── k9s/                 # k9s (Kubernetes TUI) skins
├── omz/                 # Oh-My-Zsh custom configs
│   ├── aliases.zsh      # Shell aliases
│   ├── exports.zsh      # Environment variables
│   ├── functions.zsh    # Custom shell functions
│   └── tools.zsh        # Tool-specific configs
├── vim/                 # Vim configuration
└── zsh/                 # Zsh config (.zshrc, .zprofile, p10k)
```

## Installation Pattern

Each module directory contains an `install.sh` that:
1. Creates symlinks from the repo to `$HOME` (or `~/.config`, `~/.oh-my-zsh/custom`)
2. Installs dependencies if missing (e.g., oh-my-zsh)

## Shell Stack

- **Zsh** as default shell
- **Oh-My-Zsh** for plugin management
- **Powerlevel10k** for prompt theming
- **iTerm2** with One Dark color scheme
