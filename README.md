# ryanhouston/dotfiles

Collection of my configuration files cultivated over many years. Utilizes
[GNU Stow](https://www.gnu.org/software/stow) to install and manage dotfiles across
multiple machines with a clean, modular approach.

## Philosophy

This dotfiles repository follows a package-based structure using GNU Stow:

- **Modular**: Each tool/application has its own package directory (e.g., `git/`, `tmux/`, `zsh/`)
- **XDG Compliant**: Follows [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/) using `~/.config` as the default placement for config files
- **Cross-Platform**: Works across Linux and macOS with minimal differences
- **Symlink Management**: GNU Stow creates symbolic links from `$HOME` to the package directories, making updates and version control seamless

## Package Structure

Each package directory mirrors the target directory structure:

```
package-name/
├── .config/           # XDG config files
│   └── app-name/
│       └── config-file
├── .gitconfig         # Direct dotfiles
├── .zshrc            # Shell configuration
└── bin/              # Executable scripts
```

**Current packages:**
- `ack-grep/` - Ack-grep configuration
- `alacritty/` - Terminal emulator config
- `ghostty/` - Modern terminal emulator
- `git/` - Git configuration and templates
- `opencode/` - AI coding assistant config
- `postgresql/` - PostgreSQL client configuration
- `tmux/` - Terminal multiplexer configuration
- `zsh/` - Zsh shell configuration and completions

## Install

### Prerequisites

Install [GNU Stow](https://www.gnu.org/software/stow/) and other dependencies:

- **Debian/Ubuntu**: `sudo apt install stow git tmux zsh`
- **macOS**: `brew install stow git tmux zsh`

### Quick Install

Run the installation script to create symlinks in `$HOME`:

```sh
./install.sh
```

This script:
1. Stows all packages to create symlinks
2. Handles conflicts by backing up existing files with `.pre-dotfiles` suffix
3. Sets up the complete development environment

### Manual Install

To install specific packages:

```sh
stow git --target=$HOME
stow tmux --target=$HOME
stow zsh --target=$HOME
```

To remove packages:

```sh
stow -D git --target=$HOME
```

## Post-Install Setup

### tmux

Install the catppuccin tmux theme:

```sh
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

Install tmux plugins with [tpm](https://github.com/tmux-plugins/tpm):
1. Start a tmux session
2. Press `<C-b>I` to install plugins
3. Restart tmux for changes to take effect

### alacritty

Install additional color schemes:

```sh
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/alacritty-themes
```

## Managing Multiple Machines

### Machine-Specific Configurations

For machine-specific customizations, use separate machine packages. Create packages like `work-git/` or `personal-tmux/` for environment-specific configurations. This keeps the main repository clean while allowing customization per machine.

### Adding New Packages

1. Create a new directory: `mkdir new-tool/`
2. Mirror the target directory structure
3. Add the package to `install.sh`
4. Test with: `stow new-tool --target=$HOME --simulate`

### Best Practices

- **Keep packages focused**: One tool per package directory
- **Use absolute paths**: Avoid relative paths in configurations
- **Version control everything**: Include all configuration files
- **Test before committing**: Use `--simulate` flag with stow
- **Document dependencies**: Note any external requirements in package READMEs

## Maintenance

### Updates

```sh
# Pull latest changes
git pull origin main

# Restow all packages to update symlinks
./install.sh
```

### Conflict Resolution

The install script automatically backs up conflicting files with `.pre-dotfiles` suffix. Manually resolve conflicts by:

1. Reviewing the backup files
2. Merging necessary changes
3. Removing backup files when no longer needed

### Adding New Configurations

1. Create/edit config files in the appropriate package directory
2. Test locally: `stow package-name --target=$HOME --simulate`
3. Commit changes: `git add . && git commit -m "Add new tool configuration"`
