# 🚀 Ghostty ZSH Configuration

A comprehensive terminal enhancement setup for macOS using Ghostty terminal with modern tools and productivity features.

## ✨ What This Setup Provides

- **Multi-line paste support** - No more "Are you sure?" prompts
- **Beautiful terminal appearance** with Catppuccin theme and Nerd Fonts
- **Modern command-line tools** (eza, bat, fzf, fd, ripgrep, lazygit, delta)
- **Enhanced shell experience** with Oh My Zsh and Powerlevel10k
- **Productivity aliases and functions** for faster workflow
- **Fuzzy finder integration** with keyboard shortcuts

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

4. **Install Oh My Zsh**:
   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   ```

5. **Install Oh My Zsh plugins**:
   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
   git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
   ```

6. **Copy configuration files**:
   ```bash
   cp configs/ghostty.conf ~/.config/ghostty/
   cp configs/.zshrc ~/
   cp configs/.p10k.zsh ~/
   ```

7. **Set up fzf**:
   ```bash
   $(brew --prefix)/opt/fzf/install --all
   ```

8. **Configure git delta**:
   ```bash
   git config --global core.pager delta
   git config --global interactive.diffFilter 'delta --color-only'
   git config --global delta.navigate true
   git config --global delta.side-by-side true
   git config --global delta.syntax-theme "Monokai Extended"
   ```

9. **Restart your terminal** or run:
   ```bash
   source ~/.zshrc
   ```

10. **Configure your prompt**:
    ```bash
    p10k configure
    ```

## 📁 Repository Structure

```
ghostty-zsh-config/
├── README.md                    # This file
├── configs/                     # Configuration files
│   ├── ghostty.conf            # Ghostty terminal configuration
│   ├── .zshrc                  # ZSH configuration with aliases and functions
│   └── .p10k.zsh              # Powerlevel10k prompt configuration
├── scripts/                     # Installation and utility scripts
│   ├── install.sh              # Automated installation script
│   └── update.sh               # Update all tools script
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

### Custom Functions
- `mkcd <dir>` - Create directory and cd into it
- `extract <file>` - Extract any archive format
- `backup <file>` - Create timestamped backup
- `killport <port>` - Kill process using specific port

## 📚 Documentation

- **[FEATURES.md](docs/FEATURES.md)** - Detailed feature documentation with examples
- **[ALIASES.md](docs/ALIASES.md)** - Complete alias and function reference
- **[TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)** - Common issues and solutions

## 🔧 Customization

### Customizing the Prompt
```bash
p10k configure
```

### Adding Custom Aliases
Edit `~/.zshrc` and add your aliases in the "USEFUL ALIASES" section.

### Customizing Ghostty
Edit `~/.config/ghostty/ghostty.conf` to modify terminal appearance and behavior.

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