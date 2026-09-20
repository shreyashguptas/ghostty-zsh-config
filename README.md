# 🚀 Ghostty ZSH Configuration

A lean terminal setup for macOS using the Ghostty terminal. No command replacements, no extra binaries — just a fast shell, a good prompt, and inline autosuggestions.

## ✨ What This Setup Provides

- **Inline autosuggestions** - Gray suggestion from your history as you type; `→` accepts it
- **Git-aware prompt** - Branch name, dirty/untracked state and ahead/behind counts, shown automatically in any repo
- **Fast startup** - Minimal plugin list and Powerlevel10k instant prompt
- **Multi-line paste support** - No more "Are you sure?" prompts
- **SSH terminal compatibility** - Works seamlessly when SSHing into remote devices (no more "unknown terminal type" errors)
- **Dynamic theme support** - Automatic light/dark mode switching with high contrast colors
- **Conda package management** with Python 3.12 environment and visual indicators
- **Theme management** - Easy switching between light and dark modes

> **Note:** This config deliberately does **not** install or alias fzf, eza, bat, fd, ripgrep, lazygit, delta or htop. `ls`, `cat`, `find`, `grep` and `top` are the real system commands.

## 🎯 Quick Start

### Prerequisites
- macOS (tested on macOS 14+)
- Homebrew installed
- Ghostty terminal installed

### One-Command Installation

```bash
# Clone this repository
git clone https://github.com/yourusername/ghostty-zsh-config.git
cd ghostty-zsh-config

# Run the automated setup script
chmod +x scripts/install.sh
./scripts/install.sh

# Conda is optional and off by default (~400MB, adds shell startup time).
# Add it only if you want it:
./scripts/install.sh --with-conda
```

### Manual Installation

1. **Install Homebrew** (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Ghostty**:
   ```bash
   brew install --cask ghostty
   ```

3. **Install the Nerd Font** (needed for the prompt icons):
   ```bash
   brew install --cask font-jetbrains-mono-nerd-font
   ```

4. **Install Conda and Python 3.12** (optional — skip if you don't use conda):
   ```bash
   # Download and install Miniconda
   curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
   bash Miniconda3-latest-MacOSX-arm64.sh -b -p $HOME/miniconda3
   rm Miniconda3-latest-MacOSX-arm64.sh
   
   # Initialize Conda for zsh
   $HOME/miniconda3/bin/conda init zsh
   
   # Create Python 3.12 environment
   $HOME/miniconda3/bin/conda create -n py312 python=3.12 -y
   ```

5. **Install Oh My Zsh**:
   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   ```

6. **Install Oh My Zsh plugins**:
   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
   git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
   ```

7. **Copy configuration files**:
   ```bash
   # Ghostty reads a file literally named "config" — not "ghostty.conf".
   mkdir -p ~/.config/ghostty/themes
   cp configs/ghostty.conf       ~/.config/ghostty/themes/dark.conf
   cp configs/ghostty-light.conf ~/.config/ghostty/themes/light.conf
   cp ~/.config/ghostty/themes/dark.conf ~/.config/ghostty/config

   cp configs/.zshrc ~/
   cp configs/.p10k.zsh ~/
   ```

8. **Set up theme switching**:
   ```bash
   # Make theme switching script executable
   chmod +x scripts/switch-theme.sh
   
   # Auto-detect and apply theme
   ./scripts/switch-theme.sh auto
   ```

9. **Restart your terminal** or run:
   ```bash
   source ~/.zshrc
   ```

10. **Configure your prompt** (optional):
    ```bash
    p10k configure
    ```

## 📁 Repository Structure

```
ghostty-zsh-config/
├── README.md                    # This file
├── configs/                     # Configuration files
│   ├── ghostty.conf            # Ghostty terminal configuration (dark mode)
│   ├── ghostty-light.conf      # Ghostty terminal configuration (light mode)
│   ├── .zshrc                  # ZSH configuration with aliases and functions
│   ├── .p10k.zsh              # Powerlevel10k prompt configuration
│   ├── ssh_config              # SSH config template for terminal compatibility
│   └── ghostty-ssh-colors.zsh  # Auto-tints Ghostty tabs by SSH host
├── scripts/                     # Installation and utility scripts
│   ├── install.sh              # Automated installation script
│   ├── update.sh               # Update all tools script
│   └── switch-theme.sh         # Theme switching script
└── docs/                       # Documentation
    ├── FEATURES.md             # Detailed feature documentation
    ├── ALIASES.md              # Complete alias reference
    └── TROUBLESHOOTING.md      # Troubleshooting guide
```

## 🛠️ What Gets Installed

### Shell Enhancements
- **Oh My Zsh** - ZSH framework
- **Powerlevel10k** - Fast, git-aware prompt theme
- **zsh-autosuggestions** - Inline command suggestions from history
- **zsh-syntax-highlighting** - Syntax highlighting as you type
- **zsh-completions** - Enhanced tab completion

### Other
- **JetBrains Mono Nerd Font** - Supplies the prompt glyphs
- **Conda** - Optional (`--with-conda`), with a Python 3.12 environment

Only four Oh My Zsh plugins are enabled (`git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `zsh-completions`) to keep shell startup fast.

## ⌨️ Key Features

### Autosuggestion Shortcuts
- `→` (Right Arrow) - Accept the suggestion one character at a time
- `End` - Accept the entire suggestion
- `Ctrl+→` - Accept one word at a time
- `Tab` - Show the completion menu
- `ac-help` - Print this cheatsheet in the terminal

### Useful Aliases
- `ll` - Detailed file listing
- `weather <city>` - Weather information
- `glog` - Git log with graph

### Conda Aliases
- `ca <env>` - Activate conda environment
- `cda` - Deactivate current conda environment
- `ce` - List all conda environments
- `ci <package>` - Install conda package
- `cc <env> python=x.x` - Create new conda environment
- `cr <package>` - Remove conda package
- `cup <package>` - Update conda package
- `csp <package>` - Search conda packages
- `cinfo` - Show detailed conda environment information
- `cca <env> [python_version]` - Create and activate new environment
- `crem <env>` - Remove conda environment
- `cpkg [env]` - List packages in environment
- `cexp [env] [file]` - Export environment to requirements.txt

### Theme Management
- `theme` - Auto-detect and switch terminal theme
- `theme-light` - Switch to light mode
- `theme-dark` - Switch to dark mode
- `theme-auto` - Auto-detect system theme
- `theme-status` - Check current system theme
- `reload` - Reload terminal configuration

### Custom Functions
- `mkcd <dir>` - Create directory and cd into it
- `extract <file>` - Extract any archive format
- `backup <file>` - Create timestamped backup
- `killport <port>` - Kill process using specific port

### SSH Host Tab Tinting
`ssh <host>` is wrapped so each tab's background color is deterministically derived
from the target hostname (same host always gets the same color/emoji, no lookup
table to maintain). The tab reverts to your normal theme background on disconnect.
Only active inside Ghostty.

## 📚 Documentation

- **[FEATURES.md](docs/FEATURES.md)** - Detailed feature documentation with examples
- **[ALIASES.md](docs/ALIASES.md)** - Complete alias and function reference
- **[TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)** - Common issues and solutions

## 🎨 Theme Management

### Dynamic Theme Switching
This setup includes automatic theme detection and switching:

```bash
# Auto-detect system theme and switch
theme

# Force specific themes
theme-light    # Switch to light mode
theme-dark     # Switch to dark mode
theme-auto     # Auto-detect system theme

# Check current theme
theme-status
```

### Color Scheme Features
- **High Contrast**: Optimized for readability in both light and dark modes
- **GitHub-Inspired**: Professional color palette
- **Git Integration**: Clear visual indicators for repository status
- **Conda Environment**: Visual display of active Python environments
- **Directory Paths**: High-contrast blue background with white text

### Manual Theme Switching
```bash
# Use the standalone script
./scripts/switch-theme.sh [light|dark|auto]

# Or use the ZSH functions
switch_theme light
switch_theme dark
switch_theme auto
```

## 🔧 Customization

### Customizing the Prompt
```bash
p10k configure
```

### Adding Custom Aliases
Edit `~/.zshrc` and add your aliases in the "USEFUL ALIASES" section.

### Customizing Ghostty
Edit `~/.config/ghostty/ghostty.conf` to modify terminal appearance and behavior.

### Customizing Themes
- **Dark Mode**: Edit `configs/ghostty.conf`
- **Light Mode**: Edit `configs/ghostty-light.conf`
- **Prompt Colors**: Edit `configs/.p10k.zsh`

## 🚀 Quick Commands

After installation, try these commands:

```bash
# File operations
ll                      # Detailed listing
la                      # Include hidden files

# Git operations
gs                      # Git status
gd                      # Git diff
glog                    # Git log with graph

# Themes
light                   # Switch Ghostty to light mode
dark                    # Switch Ghostty to dark mode
theme-status            # Show the current system theme

# Misc
weather London          # Weather information
ac-help                 # Autosuggestion / completion shortcuts

# Conda and Python
python --version        # Check Python version (3.12.11)
conda --version         # Check Conda version
ce                      # List conda environments
ca py312               # Activate Python 3.12 environment
ci numpy               # Install numpy with conda
```

## 🔄 Updates

To update all tools:
```bash
./scripts/update.sh
```

Or manually:
```bash
brew update && brew upgrade
```

## 🔌 SSH Terminal Compatibility

This configuration automatically fixes terminal compatibility issues when SSHing into remote devices. Ghostty terminal reports itself as "Ghostty" which remote systems don't recognize, causing errors like "unknown terminal type" and breaking commands like `clear`.

**Automatic Fix**: The `.zshrc` configuration automatically detects Ghostty and sets `TERM=xterm-256color`, which is widely supported by remote systems.

**Optional SSH Config**: For best results, you can copy the SSH config template:
```bash
mkdir -p ~/.ssh
cp configs/ssh_config ~/.ssh/config
```

This ensures the TERM variable is properly passed through SSH connections.

**Testing**: After SSHing into a remote device, verify it works:
```bash
ssh user@remote-host
echo $TERM  # Should show: xterm-256color
clear       # Should work without errors
```

See [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for more details.

## 🐛 Troubleshooting

See [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for common issues and solutions.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

If you encounter any issues or have questions:

1. Check the [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) guide
2. Search existing [Issues](https://github.com/yourusername/ghostty-zsh-config/issues)
3. Create a new issue with detailed information

## 🙏 Acknowledgments

- [Ghostty](https://github.com/ghostty-org/ghostty) - The terminal emulator
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) - ZSH framework
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Prompt theme
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Inline suggestions

---

**Happy coding! 🚀**