# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0] - 2026-09-15

### Removed (BREAKING)
- **fzf** — the fuzzy finder, its key bindings (`Ctrl+T`, `Ctrl+R`, `Alt+C` widgets),
  `FZF_DEFAULT_COMMAND`/`FZF_CTRL_T_COMMAND`/`FZF_ALT_C_COMMAND`, and the
  `~/.fzf.zsh` source line
- **eza** — and the `ls`/`ll`/`la`/`l`/`lt`/`lta` aliases that pointed at it
- **bat** — and the `cat` alias
- **fd** — and the `find` alias
- **ripgrep** — and the `grep` alias
- **lazygit** — and the `lg` alias
- **delta** — including the `git config --global core.pager delta` setup
- **htop** — and the `top` alias
- **tree** and **neofetch**
- Functions that depended on the above: `fzf-open`, `fzf-cd`, `fzf-git-log`,
  `search`, `nav`, `sysinfo`, `conda_activate` (and its `cact` alias)
- Oh My Zsh plugins trimmed from 21 to 4: removed `brew`, `macos`, `docker`,
  `docker-compose`, `node`, `npm`, `python`, `pip`, `conda`, `colored-man-pages`,
  `command-not-found`, `copyfile`, `copypath`, `dirhistory`, `history`, `sudo`,
  `web-search`, `extract` and `z`

### Added
- **Powerlevel10k instant prompt** block at the top of `.zshrc`, so the prompt
  draws immediately on shell start
- `ZSH_AUTOSUGGEST_STRATEGY=(history completion)` — suggestions now fall back to
  tab completion when history has no match
- `install.sh` now sets `push.autoSetupRemote` (so a new branch gets an upstream
  on first push, which is what the prompt's ⇡/⇣ counts compare against) and
  `fetch.prune`

### Changed
- `ls`/`ll`/`la`/`l` now use the built-in `ls` with color (`-G`)
- Conda is initialized by sourcing `conda.sh` directly rather than running
  `conda shell.zsh hook`, which spawned a Python process on every shell start
- Removed the duplicate `conda init` block and its hardcoded
  `/Users/shreyashgupta/...` paths, which only worked on one machine
- `conda activate py312` is now guarded — it no longer errors when conda or the
  environment is missing
- Removed the redundant second `compinit` call (Oh My Zsh already runs it)

### Kept
- zsh-autosuggestions, zsh-syntax-highlighting and zsh-completions
- The Powerlevel10k prompt with git branch, dirty state and ahead/behind counts
- Light/dark theme switching and the Ghostty color schemes
- SSH `TERM` compatibility fix
- All conda, git, navigation and theme aliases

## [1.1.0] - 2024-12-06

### Added
- **Dynamic Theme Support**: Automatic light/dark mode switching based on macOS system theme
- **Enhanced Color Schemes**: High-contrast colors optimized for readability in both light and dark modes
- **GitHub-Inspired Palette**: Professional color scheme replacing Catppuccin theme
- **Light Mode Configuration**: Complete light mode support with `ghostty-light.conf`
- **Theme Management Functions**: Easy switching between light and dark modes
- **Enhanced Conda Display**: Visual indicators for active Conda environments in prompt
- **Theme Switching Script**: Standalone script for easy theme management
- **Additional Conda Functions**: 
  - `conda_info()` - Detailed environment information
  - `conda_activate()` - Interactive environment selection with fzf
  - `conda_create_activate()` - Create and activate new environment
  - `conda_remove_env()` - Remove environment safely
  - `conda_packages()` - List packages in environment
  - `conda_export()` - Export environment to requirements.txt
- **Enhanced Conda Aliases**: Additional cleanup and management aliases
- **Theme Management Aliases**: Quick access to theme switching functions

### Changed
- **Color Scheme**: Upgraded from Catppuccin to GitHub-inspired colors for better contrast
- **Dark Mode Colors**: Improved contrast and readability with GitHub dark theme
- **Powerlevel10k Colors**: Enhanced color scheme for better visibility
- **Directory Display**: High-contrast blue background with white text
- **Git Status Colors**: Clear visual indicators for repository status
- **Conda Environment Display**: Green background with white text for better visibility

### Enhanced
- **Readability**: Significantly improved text readability in both light and dark modes
- **Visual Hierarchy**: Better color coding for different types of information
- **Accessibility**: High contrast ratios for better accessibility
- **Professional Appearance**: GitHub-inspired design for a more professional look
- **Theme Detection**: Automatic detection of macOS system theme changes

### New Files
- `configs/ghostty-light.conf` - Light mode terminal configuration
- `scripts/switch-theme.sh` - Theme switching script

### Updated Files
- `configs/ghostty.conf` - Enhanced dark mode colors
- `configs/.zshrc` - Added theme management and enhanced Conda functions
- `configs/.p10k.zsh` - Improved color scheme and Conda display
- `README.md` - Updated with new features and theme management
- `docs/FEATURES.md` - Added theme management section
- `docs/ALIASES.md` - Added new aliases and functions

## [1.0.0] - 2024-12-06

### Added
- Initial release of Ghostty ZSH Configuration
- Multi-line paste support for Ghostty terminal
- Catppuccin Mocha theme with dark background
- JetBrains Mono Nerd Font integration
- Powerlevel10k prompt with git status and system info
- Oh My Zsh framework with essential plugins
- Modern command-line tools:
  - fzf (fuzzy finder)
  - bat (syntax-highlighted file viewer)
  - eza (modern file listing with icons)
  - fd (fast file search)
  - ripgrep (lightning-fast text search)
  - lazygit (beautiful git interface)
  - delta (better git diffs)
  - htop (enhanced process viewer)
- Comprehensive alias collection for productivity
- Custom functions for common tasks
- Keyboard shortcuts for fuzzy finding
- Automated installation script
- Update script for maintaining tools
- Complete documentation:
  - README.md with quick start guide
  - FEATURES.md with detailed feature documentation
  - ALIASES.md with complete alias reference
  - TROUBLESHOOTING.md with common issues and solutions
- Configuration files:
  - ghostty.conf for terminal settings
  - .zshrc with all aliases and functions
  - .p10k.zsh for prompt configuration

### Features
- **Multi-line Paste**: Fixed Ghostty's "Are you sure?" prompt issue
- **Beautiful UI**: Modern terminal appearance with icons and colors
- **Productivity Tools**: Fast, modern alternatives to standard commands
- **Git Integration**: Beautiful git interface and better diffs
- **Fuzzy Finding**: Quick file and directory navigation
- **System Monitoring**: Enhanced process and system information tools
- **Customization**: Easy to customize and extend

### Installation
- One-command installation via `./scripts/install.sh`
- Manual installation steps documented
- Prerequisites checking and automatic installation
- Configuration file backup and restoration

### Documentation
- Comprehensive README with quick start guide
- Detailed feature documentation with examples
- Complete alias and function reference
- Troubleshooting guide for common issues
- Pro tips and usage examples