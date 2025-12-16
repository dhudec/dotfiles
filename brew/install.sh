#!/usr/bin/env zsh

set -e

echo "📦 Installing Homebrew packages from Brewfile..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not found. Install from https://brew.sh first"
    exit 1
fi

# Install packages from Brewfile
cd "${DOTFILES_LOCATION}" && brew bundle install

echo "✅ Homebrew packages installed"
