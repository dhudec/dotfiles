# Global Context

## Workstation Configuration

Shell and tooling configuration is managed in code via the dotfiles repo:
`~/src/github/dhudec/dotfiles`

**When making configuration changes** (shell aliases, environment variables, git config, iTerm2 settings, k9s skins, etc.), update the dotfiles repo rather than editing files directly in `$HOME`. Run `./install.sh` to apply changes via symlinks.

## Developer Environment

### Tool Management
- **Homebrew**: Primary package manager for CLI tools and GUI apps
- **asdf**: Version manager for runtimes (Go 1.23.11, Node 21.6.0, Python 3.10.8, Java openjdk-17)

### Key CLI Tools
- **Cloud/DevOps**: awscli, kubectl, k9s, helm, terraform, sops
- **Development**: gh, git, jq, yarn
- **Scripting**: Bash for simple tasks, Node for complex tasks (rarely Python)
- **Testing**: k6 (performance), bruno (API testing, collections in `~/src/github/dhudec/bruno-collections`)
- **Security**: gnupg, 1password-cli, cloudflared

## Git Workflow

Trunk-based development with `master` as the main branch.

**Branch naming:**
- `ENG-123` - Linear ticket (preferred when available)
- `feat/<description>` - Feature without ticket
- `fix/<description>` - Bug fix without ticket

## Runtime Version Management

Use `.tool-versions` in each repo to pin asdf-managed runtimes. Example:

```
nodejs 20.19.4
yarn 1.22.22
```

Infer the appropriate tools and versions from each repo's context (package.json, go.mod, etc.). Run `asdf install` to install pinned versions.

## Code Organization

All code lives in `~/src/`:

```
~/src/
├── github/                    # GitHub repos organized by org/repo
│   ├── basis-theory/          # Main work organization
│   ├── basis-theory-labs/     # Experiments
│   ├── dhudec/                # Personal repos
│   └── [other orgs]/          # Third-party/forked repos
│
└── sandbox/                   # Experimental/scratch projects
```
