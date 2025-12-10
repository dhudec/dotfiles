# Dotfiles

Personal dotfiles for bootstrapping and maintaining a macOS development workstation. This repository manages shell environments, developer tooling, and application preferences through version-controlled configuration files.

## Philosophy

Configuration is code. Rather than manually editing files scattered throughout `$HOME`, this repository:
- Centralizes all configuration in one place
- Uses symlinks to deploy configs to their expected locations
- Enables rapid workstation setup and consistent environments across machines
- Tracks configuration changes through git history

## Quick Start

```sh
git clone https://github.com/dhudec/dotfiles.git ~/src/github/dhudec/dotfiles
cd ~/src/github/dhudec/dotfiles
./install.sh
```

## What Gets Configured

### Shell Environment
- **Zsh** as default shell with Oh-My-Zsh framework
- **Powerlevel10k** theme for a powerful, informative prompt
- Custom aliases, functions, and environment variables
- Tool-specific configurations (kubectl, AWS CLI, terraform, etc.)

### Development Tools
- **Git**: Configuration, aliases, and credential management
- **AWS CLI**: Config templates and SSO profile setup
- **Kubernetes**: kubectl/k9s with custom skins and context switching aliases
- **Vim**: Basic editor configuration

### Applications
- **iTerm2**: Preferences and One Dark color scheme
- **k9s**: Custom skins for Kubernetes cluster management
- **Claude Code**: Global settings, custom agents, and user memory

## Repository Structure

```
dotfiles/
├── install.sh              # Main installer - runs all modules
├── bin/dotfiles            # CLI for individual module installation
│
├── aws/                    # AWS CLI config and credentials templates
│   ├── config              # AWS profiles and SSO configuration
│   └── install.sh          # Symlinks to ~/.aws/
│
├── claude/                 # Claude Code configuration
│   ├── CLAUDE.md           # Global user memory and context
│   ├── settings.json       # Global Claude Code settings
│   ├── settings.local.json # Permission overrides
│   ├── agents/             # Custom agent configurations
│   └── install.sh          # Symlinks to ~/.claude/
│
├── git/                    # Git configuration
│   ├── .gitconfig          # Main git config with aliases and settings
│   ├── .gitconfig-dhudec   # User-specific config (included conditionally)
│   └── install.sh          # Symlinks to ~/
│
├── iterm2/                 # iTerm2 preferences
│   ├── com.googlecode.iterm2.plist  # Full iTerm2 configuration
│   ├── one-dark.itermcolors         # Color scheme
│   └── install.sh          # Loads preferences
│
├── k9s/                    # Kubernetes TUI configuration
│   ├── skins/              # Custom color schemes for k9s
│   └── install.sh          # Symlinks to ~/.config/k9s/
│
├── omz/                    # Oh-My-Zsh custom configurations
│   ├── aliases.zsh         # Shell aliases (AWS, k8s, utilities)
│   ├── exports.zsh         # Environment variables
│   ├── functions.zsh       # Custom shell functions
│   ├── tools.zsh           # Tool-specific configs
│   └── install.sh          # Symlinks to ~/.oh-my-zsh/custom/
│
├── vim/                    # Vim configuration
│   ├── .vimrc              # Vim settings
│   └── install.sh          # Symlinks to ~/
│
└── zsh/                    # Zsh core configuration
    ├── .zshrc              # Main zsh configuration
    ├── .zprofile           # Login shell configuration
    ├── .p10k.zsh           # Powerlevel10k theme settings
    └── install.sh          # Symlinks to ~/
```

## Installation

### Full Installation

Install all modules at once:

```sh
./install.sh
```

This will:
1. Create symlinks from this repo to their target locations
2. Install missing dependencies (e.g., Oh-My-Zsh if not present)
3. Preserve existing files by symlinking over them

### Modular Installation

Install specific modules individually:

```sh
./bin/dotfiles install <module>
```

Available modules:
- `aws` - AWS CLI configuration
- `claude` - Claude Code settings and agents
- `git` - Git configuration
- `iterm2` - iTerm2 preferences
- `k9s` - k9s skins and config
- `omz` - Oh-My-Zsh custom files
- `vim` - Vim configuration
- `zsh` - Zsh shell configuration

Example:
```sh
./bin/dotfiles install git
./bin/dotfiles install zsh
```

## Making Changes

### Workflow

1. **Edit files in this repository**, not in `$HOME`:
   ```sh
   # Good
   code ~/src/github/dhudec/dotfiles/omz/aliases.zsh

   # Bad (changes will be lost)
   code ~/.oh-my-zsh/custom/aliases.zsh
   ```

2. **Test changes** by re-running the module's installer:
   ```sh
   ./bin/dotfiles install omz
   source ~/.zshrc
   ```

3. **Commit and push** to preserve changes:
   ```sh
   git add -A
   git commit -m "feat: add new terraform alias"
   git push
   ```

### Common Modifications

#### Adding a Shell Alias
Edit [omz/aliases.zsh](omz/aliases.zsh):
```sh
alias myalias='command here'
```

Then reload:
```sh
source ~/.zshrc
```

#### Adding Environment Variables
Edit [omz/exports.zsh](omz/exports.zsh):
```sh
export MY_VAR="value"
```

#### Changing Git Configuration
Edit [git/.gitconfig](git/.gitconfig) for global settings, or [git/.gitconfig-dhudec](git/.gitconfig-dhudec) for user-specific overrides.

#### Updating iTerm2 Preferences
Make changes in iTerm2, then copy the preferences file back:
```sh
cp ~/Library/Preferences/com.googlecode.iterm2.plist iterm2/
```

#### Modifying Claude Code Settings
Edit [claude/settings.json](claude/settings.json) for global preferences (model, MCP servers), or [claude/CLAUDE.md](claude/CLAUDE.md) for global context/instructions. Changes to agents should be made in [claude/agents/](claude/agents/).

## Prerequisites

- macOS (tested on recent versions)
- Zsh (default shell on modern macOS)
- Git
- Internet connection (for installing Oh-My-Zsh)

## Notable Features

### AWS & Kubernetes Workflow
Preconfigured aliases for common AWS and Kubernetes operations:
```sh
aws-login                      # SSO login
aws-eks-login-prod-us-east-2   # Update kubeconfig for prod cluster
k9s-prod-us-east-2             # Launch k9s for prod cluster
kubectl-use-dev-us-west-2      # Switch kubectl context
```

### Shell Aliases
Quick access to common commands:
```sh
src                # Jump to ~/src/github
uuid               # Generate and copy a UUID to clipboard
ip                 # Get public IP address
tf                 # Terraform shorthand
k                  # kubectl shorthand
```

### Git Enhancements
Custom git aliases and configuration for improved workflow (see [git/.gitconfig](git/.gitconfig)).

## Troubleshooting

### Symlinks Not Working
Ensure `DOTFILES_LOCATION` is set correctly. Re-run from the repo root:
```sh
cd ~/src/github/dhudec/dotfiles
./install.sh
```

### Oh-My-Zsh Not Found
The [omz/install.sh](omz/install.sh) script will automatically install Oh-My-Zsh if missing. If issues persist, install manually:
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Changes Not Reflected
After editing files in the repo, reload your shell:
```sh
source ~/.zshrc
```

Or open a new terminal session.

## Related

This dotfiles setup is designed to work with:
- **Homebrew** for package management
- **asdf** for runtime version management (Node, Go, Python, Java)
- **1Password CLI** for secrets management
- **Bruno** for API testing (collections in `~/src/github/dhudec/bruno-collections`)

## License

Personal configuration - use at your own discretion.