# AGENTS.md - Project Guide for AI Agents

## Project Overview

**Ubuntu Setup** is an opinionated Ubuntu setup automation tool that transforms a fresh Ubuntu 25.10+ installation into a fully-configured development environment with a single command. It is a fork/variant of Basecamp's [Omakub](https://github.com/basecamp/omakub) project, customized by @bladecoder.

**Philosophy**: Following the "omakase" (お任せ) approach - "I leave it up to you" - where a curated selection of tools and configurations is provided based on the maintainer's preferences and experience.

## Project Purpose

- **Automated System Setup**: Eliminate manual configuration of a new Ubuntu system
- **Development Environment**: Install and configure development tools, languages, and IDEs
- **Desktop Customization**: Apply consistent theming, fonts, and GNOME settings
- **Shell Enhancement**: Set up an optimized bash environment with modern CLI tools
- **Reproducibility**: Ensure consistent setup across different machines

## System Requirements

- **OS**: Ubuntu 25.10 or higher
- **Architecture**: x86_64 or i686 only
- **Desktop Environment**: GNOME (full features) or any DE (terminal-only mode)
- **Network**: Internet connection required for downloading packages

## Project Structure

```
ubuntu-setup/
├── bootstrap.sh               # Bootstrap script (downloads and runs setup)
├── setup.sh                   # Main installation orchestrator
├── scripts/
│   ├── check-version.sh       # OS/architecture validation
│   ├── required.sh            # Pre-installation requirements
│   ├── identification.sh      # User identification setup
│   ├── terminal.sh            # Terminal tools installation orchestrator
│   ├── desktop.sh             # Desktop tools installation orchestrator
│   ├── terminal/              # Terminal application installers (ordered by prefix)
│   │   ├── 10_packages.sh     # Base CLI packages
│   │   ├── 20_bash.sh         # Bash shell configuration
│   │   ├── 20_docker.sh       # Docker and Docker Compose
│   │   ├── 30_install-dev-languages.sh  # Programming languages via mise
│   │   ├── 40_android-sdk.sh  # Android SDK setup
│   │   └── optional/          # Optional terminal tools
│   └── desktop/               # Desktop application installers (ordered by prefix)
│       ├── 00_fonts.sh        # Fonts
│       ├── 10_set-gnome-settings.sh    # GNOME settings
│       ├── 10_set-gnome-theme.sh       # GNOME theme
│       ├── 20_vscode.sh       # VS Code
│       ├── 40_set-dock.sh     # Dock configuration
│       └── optional/          # Optional desktop applications
└── configs/                   # Configuration files
   ├── bashrc                 # Main bashrc file
   ├── btop.conf              # btop configuration
   ├── inputrc                # Readline configuration
   ├── vimrc                  # Vim configuration
   ├── vscode.json            # VS Code settings
   ├── bash/                  # Bash configuration modules
   │   ├── aliases            # Command aliases
   │   ├── functions          # Shell functions
   │   ├── init               # Initialization snippets
   │   ├── prompt             # Custom prompt
   │   ├── rc                 # Main bash runtime config
   │   └── shell              # Shell-specific settings
   ├── capstoesc/             # Caps-to-Esc config + service
   ├── icons/                 # Icons and assets
   ├── neovim/                # Neovim configurations
   ├── theme/                 # Theme files and settings
   └── xkb/                   # Custom keyboard layouts
```

## Installation Flow

### Entry Points

1. **Remote Bootstrap** (recommended):
   ```bash
   curl -L https://raw.githubusercontent.com/bladecoder/ubuntu-setup/main/bootstrap.sh | bash
   ```
   - Downloads repository as ZIP
   - Extracts to a temp folder
   - Runs `setup.sh`

2. **Local Installation**:
   ```bash
   git clone https://github.com/bladecoder/ubuntu-setup.git
   cd ubuntu-setup
   ./setup.sh
   ```

### Installation Process

1. **Validation** (`scripts/check-version.sh`):
   - Verifies Ubuntu 25.10+
   - Checks x86 architecture
   - Exits if requirements not met

2. **Pre-requisites** (`scripts/required.sh`):
   - Installs base dependencies

3. **User Setup** (`scripts/identification.sh`):
   - Configures user identity

4. **Environment Detection**:
   - If GNOME/Unity: Installs terminal + desktop tools
   - Otherwise: Installs terminal tools only

5. **Terminal Installation** (`scripts/terminal.sh`):
   - Executes all scripts in `scripts/terminal/*.sh`
   - Order matters: numeric prefixes determine execution order

6. **Desktop Installation** (`scripts/desktop.sh`) [GNOME only]:
   - Disables screen lock/sleep during installation
   - Executes all scripts in `scripts/desktop/*.sh`
   - Re-enables screen lock/sleep
   - Prompts for reboot

## Key Components

### Terminal Tools

**Shell Configuration**:
- Bash with custom prompt, aliases, and functions
- Modern CLI tools: `eza` (ls replacement), `bat`, `fzf`, `zoxide`
- Custom aliases for git, docker, navigation

**Development Languages** (via [mise](https://mise.jdx.dev/)):
- Node.js (LTS)
- Python (latest)
- Java (latest)
- Rust (latest)

**Development Tools**:
- Docker & Docker Compose
- Neovim with LazyVim
- Git configuration
- Lazygit, Lazydocker
- btop (system monitor)
- fastfetch (system info)

**System Enhancements**:
- Caps Lock → Escape remapping
- Custom "Spanglish" keyboard layout
- Mouse lag fix
- Android SDK support
- Inklecate (for Ink story development)

### Desktop Applications

**IDEs & Editors**:
- VS Code with Tokyo Night theme
- IntelliJ IDEA

**Productivity**:
- Google Chrome
- LibreOffice
- GNOME Tweaks
- GNOME Sushi (file previewer)
- Transmission (BitTorrent)

**Media**:
- VLC
- Audacity
- Inky (Ink story editor)

**Graphics Tools**:
- Various graphic design applications

**Theme & Appearance**:
- Tokyo Night color scheme
- Yaru purple theme
- Custom fonts
- Dark mode preferred
- Custom dock configuration

### Optional Components

Located in `scripts/*/optional/` directories:

**Terminal**:
- Ollama (local LLM runtime)
- Development storage configuration

**Desktop**:
- Flatpak support
- Additional IDEs (Cursor, Windsurf, Zed)
- Communication (Slack, Signal, Zoom)
- Cloud storage (Dropbox, Insync)
- Entertainment (Spotify, Steam, RetroArch)
- Utilities (Flameshot, LocalSend, OBS Studio)
- GNOME extensions & hotkeys
- XCompose for special characters

## Configuration Files

### Bash Configuration

**Main entry**: `$HOME/.bashrc` (from `configs/bashrc`)
- Sources `$HOME/.local/share/bash/rc`
- User customizations go in `$HOME/.bashrc`

**Modular configs** in `$HOME/.local/share/bash/`:
- `aliases`: Command shortcuts and overrides
- `functions`: Shell functions (e.g., `web2app`)
- `prompt`: Custom bash prompt
- `rc`: Main runtime configuration
- `shell`: Shell-specific settings

**Key Features**:
- `eza` for colored, icon-enhanced directory listings
- `zoxide` (`zd` command) for smart directory navigation
- Git workflow aliases (`g`, `gs`, `gcm`, `gp`, etc.)
- `web2app` function to create desktop launchers for web apps
- `please` alias to re-run last command with sudo

### VS Code Configuration

Location: `$HOME/.config/Code/User/settings.json` (from `configs/vscode.json`)
- Automatically installed Tokyo Night theme

### Neovim Configuration

Location: `$HOME/.config/nvim/`
- LazyVim-based setup
- Custom transparency settings
- Animated scrolling disabled

### Theme Configuration

**GNOME Settings**:
- Color scheme: Dark
- GTK theme: Yaru-purple-dark
- Icon theme: Yaru-purple
- Accent color: Purple
- Terminal: Ptyxis with Tokyo Night palette

**Custom Elements**:
- Background image
- User avatar
- Consistent purple/Tokyo Night aesthetic

## Script Naming Convention

- `NN_*.sh`: Ordered execution by numeric prefix (e.g., `00_`, `10_`, `20_`)
- `app-*.sh`: Application installation (commonly under `optional/`)
- `set-*.sh`: System/configuration setup
- `install-*.sh`: Meta-installation scripts

## Working with Individual Scripts

Scripts can be run individually from the project root:

```bash
cd ubuntu-setup
source scripts/desktop/optional/app-slack.sh
```

**Important**: Use `source` to run scripts in the current shell context.

## Development Patterns

### Adding New Applications

1. Create `scripts/terminal/app-yourapp.sh` or `scripts/desktop/app-yourapp.sh`
2. Include installation logic:
   ```bash
   #!/bin/bash

   # Add repository if needed
   # Install package
   # Copy configurations
   ```
3. Make executable: `chmod +x scripts/*/app-yourapp.sh`
4. Script will auto-run on next full installation

### Adding Configurations

1. Place config file in `configs/` directory
2. Copy to appropriate location in installation script
3. Backup existing configs before overwriting

### Adding Optional Components

1. Place in `scripts/*/optional/` directory
2. Won't run automatically during full install
3. User can run manually when needed

## Common Tasks for AI Agents

### Adding a New Application

1. Determine if terminal or desktop application
2. Create appropriately named script in `scripts/terminal/` or `scripts/desktop/`
3. Include error handling: `set -e` for failing fast
4. Test installation steps
5. Add any configuration files to `configs/`

### Modifying Bash Aliases

1. Edit `configs/bash/aliases`
2. Test locally before committing
3. Remember aliases affect all users who install

### Updating Theme

1. Modify files in `configs/theme/`
2. Update `scripts/desktop/10_set-gnome-theme.sh` if needed
3. Ensure color scheme consistency

### Troubleshooting Installation

1. Check `$HOME/ubuntu-setup.log` if using recommended install method
2. Verify Ubuntu version: `lsb_release -a`
3. Ensure internet connectivity
4. Check if script has execute permissions
5. Run individual scripts to isolate issues

## Important Notes

- **Idempotency**: Scripts should be safely re-runnable
- **Error Handling**: `set -e` causes scripts to exit on first error
- **Backup Strategy**: Existing configs are backed up with `.bak` extension
- **User Context**: Scripts run as regular user, use `sudo` when needed
- **Shell Context**: Desktop installation prompts for reboot at end
- **Logging**: Redirect to log file for debugging: `./setup.sh 2>&1 | tee $HOME/ubuntu-setup.log`

## Key Technologies

- **Package Managers**: apt, snap, flatpak (optional)
- **Language Manager**: mise (formerly rtx)
- **Shell**: Bash (not zsh)
- **Terminal Emulator**: Ptyxis (GNOME default)
- **Version Control**: Git
- **Containerization**: Docker
- **Desktop Environment**: GNOME 49+ (Ubuntu 25.10)

## Customization Philosophy

Ubuntu Setup is opinionated but extensible:
- Core tools in main installation
- Optional tools in `optional/` directories
- User overrides in `$HOME/.bashrc` and similar config files
- Fork-friendly: Encouraged to create your own variant

## References

- Original Project: [Omakub by Basecamp](https://github.com/basecamp/omakub)
- Repository: https://github.com/bladecoder/ubuntu-setup
- Maintainer: @bladecoder

---

*This document is designed to help AI agents understand the project structure, make informed modifications, and assist users effectively. Keep this updated as the project evolves.*
