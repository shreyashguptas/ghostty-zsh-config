# 🚀 Ghostty ZSH Configuration

A comprehensive terminal enhancement setup for macOS using Ghostty terminal with modern tools and productivity features.

## ✨ What This Setup Provides

- **Multi-line paste support** - No more "Are you sure?" prompts
- **Dynamic theme support** - Automatic light/dark mode switching with high contrast colors
- **Beautiful terminal appearance** with GitHub-inspired theme and Nerd Fonts
- **Modern command-line tools** (eza, bat, fzf, fd, ripgrep, lazygit, delta)
- **Enhanced shell experience** with Oh My Zsh and Powerlevel10k
- **Conda package management** with Python 3.12 environment and visual indicators
- **Productivity aliases and functions** for faster workflow
- **Fuzzy finder integration** with keyboard shortcuts
- **Theme management** - Easy switching between light and dark modes

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

3. **Install required tools**:
   ```bash
   brew install fzf bat eza fd ripgrep tree htop lazygit delta
   brew install --cask font-jetbrains-mono-nerd-font
   ```

4. **Install Conda and Python 3.12**:
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
   cp configs/ghostty.conf ~/.config/ghostty/
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

9. **Set up fzf**:
   ```bash
   $(brew --prefix)/opt/fzf/install --all
   ```

10. **Configure git delta**:
    ```bash
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global delta.side-by-side true
    git config --global delta.syntax-theme "Monokai Extended"
    ```

11. **Restart your terminal** or run:
    ```bash
    source ~/.zshrc
    ```

12. **Configure your prompt**:
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
│   └── .p10k.zsh              # Powerlevel10k prompt configuration
├── scripts/                     # Installation and utility scripts
│   ├── install.sh              # Automated installation script
│   ├── update.sh               # Update all tools script
│   └── switch-theme.sh         # Theme switching script
└── docs/                       # Documentation
    ├── FEATURES.md             # Detailed feature documentation
    ├── ALIASES.md              # Complete alias reference
    └── TROUBLESHOOTING.md      # Troubleshooting guide
```

## 🛠️ Tools Included

### Core Tools
- **fzf** - Fuzzy finder for files, directories, and history
- **bat** - Syntax-highlighted file viewer
- **eza** - Modern file listing with icons
- **fd** - Fast file search
- **ripgrep** - Lightning-fast text search
- **lazygit** - Beautiful git interface
- **delta** - Better git diffs
- **htop** - Enhanced process viewer
- **Conda** - Package manager with Python 3.12 environment

### Shell Enhancements
- **Oh My Zsh** - ZSH framework
- **Powerlevel10k** - Beautiful prompt theme
- **zsh-autosuggestions** - Command suggestions
- **zsh-syntax-highlighting** - Syntax highlighting
- **zsh-completions** - Enhanced tab completion

## ⌨️ Key Features

### Keyboard Shortcuts
- `Ctrl+T` - Fuzzy file search
- `Ctrl+R` - Fuzzy history search
- `Alt+C` - Fuzzy directory navigation

### Useful Aliases
- `ll` - Detailed file listing with icons
- `lg` - Open lazygit interface
- `sysinfo` - System information
- `weather <city>` - Weather information
- `fzf-open` - Find and open files
- `search <pattern>` - Search files with ripgrep + fzf

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
- `cact` - Interactive conda environment selection with fzf
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
ls                      # Modern file listing with icons
ll                      # Detailed listing
lt                      # Tree view
fzf-open                # Find and open files

# Git operations
lg                      # Beautiful git interface
gs                      # Git status
glog                    # Git log with graph

# System information
sysinfo                 # System information
htop                    # Process viewer
weather London          # Weather information

# Search and navigation
search "function"       # Search files
nav                     # Navigate directories
Ctrl+R                  # Search command history

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
- [fzf](https://github.com/junegunn/fzf) - Fuzzy finder
- [eza](https://github.com/eza-community/eza) - Modern ls replacement
- [bat](https://github.com/sharkdp/bat) - Modern cat replacement
- [lazygit](https://github.com/jesseduffield/lazygit) - Git interface
- [delta](https://github.com/dandavison/delta) - Git diff tool

---

**Happy coding! 🚀**