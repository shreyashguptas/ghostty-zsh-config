# 🚀 Ghostty Terminal Enhancements - Complete Guide

## Overview
This document explains all the enhancements made to your Ghostty terminal, including new tools, features, and how to use them effectively.

---

## 📋 Table of Contents
1. [Multi-line Paste Fix](#1-multi-line-paste-fix)
2. [EZA - Modern File Listing](#2-eza---modern-file-listing)
3. [BAT - Syntax-Highlighted File Viewing](#3-bat---syntax-highlighted-file-viewing)
4. [FZF - Fuzzy Finder](#4-fzf---fuzzy-finder)
5. [FD - Fast File Search](#5-fd---fast-file-search)
6. [RIPGREP - Fast Text Search](#6-ripgrep---fast-text-search)
7. [LAZYGIT - Beautiful Git Interface](#7-lazygit---beautiful-git-interface)
8. [DELTA - Better Git Diffs](#8-delta---better-git-diffs)
9. [HTOP - Enhanced Process Viewer](#9-htop---enhanced-process-viewer)
10. [Powerlevel10k - Beautiful Prompt](#10-powerlevel10k---beautiful-prompt)
11. [Oh My Zsh Plugins](#11-oh-my-zsh-plugins)
12. [Conda Package Manager](#12-conda-package-manager)
13. [Useful Aliases](#13-useful-aliases)
14. [Custom Functions](#14-custom-functions)
15. [Keyboard Shortcuts](#15-keyboard-shortcuts)

---

## 1. Multi-line Paste Fix

### What Changed
- **Problem**: Ghostty was asking "Are you sure?" when pasting multi-line content
- **Solution**: Added configuration to automatically handle multi-line pastes

### Configuration Added
```bash
# In ~/.config/ghostty/ghostty.conf
paste-multiline-mode auto
paste-multiline-delay 0.1
```

### How to Test
1. Copy a multi-line script or text
2. Paste it into your terminal
3. It should paste immediately without any prompts!

---

## 2. EZA - Modern File Listing

### What is EZA?
EZA is a modern replacement for the `ls` command with better colors, icons, and formatting.

### Features
- **Icons**: Shows file type icons
- **Colors**: Better color coding
- **Tree view**: Directory structure visualization
- **Git integration**: Shows git status in file listings

### Commands Available
```bash
# Basic listing (now aliased to 'ls')
eza --icons

# Detailed listing (now aliased to 'll')
eza -alF --icons

# Tree view (now aliased to 'lt')
eza --tree --level=2 --icons

# Tree view with hidden files (now aliased to 'lta')
eza --tree --level=2 --all --icons
```

### How to Test
```bash
# Try these commands in your terminal:
ls          # Now uses eza with icons
ll          # Detailed listing with icons
lt          # Tree view of current directory
lta         # Tree view including hidden files
```

---

## 3. BAT - Syntax-Highlighted File Viewing

### What is BAT?
BAT is a modern replacement for the `cat` command with syntax highlighting and line numbers.

### Features
- **Syntax highlighting**: Colors code based on file type
- **Line numbers**: Shows line numbers
- **Git integration**: Highlights git changes
- **Paging**: Built-in paging support

### Commands Available
```bash
# Basic file viewing (now aliased to 'cat')
bat filename

# With line numbers
bat -n filename

# With git integration
bat --git filename

# Show all features
bat --style=full filename
```

### How to Test
```bash
# Try these commands:
cat ~/.zshrc          # Now uses bat with syntax highlighting
bat ~/.zshrc          # Same result, more explicit
bat --style=full ~/.zshrc  # Show all features
```

---

## 4. FZF - Fuzzy Finder

### What is FZF?
FZF is a fuzzy finder that helps you quickly find files, directories, and commands.

### Features
- **Fuzzy search**: Type partial matches to find files
- **Preview**: See file contents while searching
- **Multiple modes**: File search, directory search, history search
- **Keyboard shortcuts**: Integrated with terminal

### Commands Available
```bash
# File search
fzf

# Directory search
fzf --type=d

# History search
fzf --history

# Custom functions
fzf-open    # Find and open files
fzf-cd      # Find and cd into directories
nav         # Quick directory navigation
```

### Keyboard Shortcuts
- **Ctrl+T**: Search and insert files
- **Ctrl+R**: Search command history
- **Alt+C**: Search and cd into directories

### How to Test
```bash
# Try these:
fzf                    # Search for files
Ctrl+T                 # Search and insert files
Ctrl+R                 # Search command history
fzf-open               # Find and open a file
nav                    # Navigate to a directory
```

---

## 5. FD - Fast File Search

### What is FD?
FD is a fast, user-friendly alternative to the `find` command.

### Features
- **Speed**: Much faster than traditional `find`
- **Smart defaults**: Ignores .git, .node_modules, etc.
- **Regex support**: Pattern matching
- **Type filtering**: Search by file type

### Commands Available
```bash
# Basic search (now aliased to 'find')
fd pattern

# Search by extension
fd -e txt

# Search by type
fd -t f    # files only
fd -t d    # directories only

# Case insensitive
fd -i pattern

# Include hidden files
fd -H pattern
```

### How to Test
```bash
# Try these commands:
find "*.md"            # Now uses fd - much faster!
fd "*.md"              # Same result, more explicit
fd -e py               # Find all Python files
fd -t d                # Find all directories
```

---

## 6. RIPGREP - Fast Text Search

### What is RIPGREP?
RIPGREP is an extremely fast text search tool, much faster than `grep`.

### Features
- **Speed**: Lightning fast text search
- **Smart defaults**: Ignores binary files and .git
- **Regex support**: Full regex pattern matching
- **Context**: Show lines before/after matches

### Commands Available
```bash
# Basic search (now aliased to 'grep')
rg pattern

# Search in specific file types
rg -t py pattern

# Case insensitive
rg -i pattern

# Show context lines
rg -C 3 pattern

# Search and replace
rg -l pattern | xargs sed -i 's/old/new/g'
```

### How to Test
```bash
# Try these commands:
grep "function" ~/.zshrc    # Now uses ripgrep - much faster!
rg "function" ~/.zshrc      # Same result, more explicit
rg -i "git" ~/.zshrc        # Case insensitive search
rg -C 2 "alias" ~/.zshrc    # Show 2 lines of context
```

---

## 7. LAZYGIT - Beautiful Git Interface

### What is LAZYGIT?
LAZYGIT is a simple, fast, and beautiful terminal UI for git.

### Features
- **Visual interface**: See all git operations in a beautiful UI
- **Staging**: Easy file staging and unstaging
- **Commits**: Visual commit creation
- **Branches**: Easy branch management
- **Logs**: Beautiful git log visualization

### Commands Available
```bash
# Open lazygit (now aliased to 'lg')
lazygit

# In lazygit interface:
# - j/k: Navigate up/down
# - Enter: Select/expand
# - Space: Stage/unstage files
# - c: Commit
# - p: Push
# - P: Pull
# - b: Create branch
# - d: Delete branch
# - q: Quit
```

### How to Test
```bash
# Try this:
lg                      # Opens beautiful git interface
# Navigate with j/k, stage files with space, commit with c
```

---

## 8. DELTA - Better Git Diffs

### What is DELTA?
DELTA is a syntax-highlighting pager for git, diff, and grep output.

### Features
- **Syntax highlighting**: Colors in diff output
- **Side-by-side**: Compare changes side by side
- **Git integration**: Automatically used with git
- **Custom themes**: Beautiful color schemes

### Configuration Added
```bash
# Git configuration for delta
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Monokai Extended"
```

### How to Test
```bash
# Try these commands:
git diff                # Now uses delta with beautiful highlighting
git log --oneline       # See commit history
git show HEAD           # See last commit with delta highlighting
```

---

## 9. HTOP - Enhanced Process Viewer

### What is HTOP?
HTOP is an interactive process viewer, much better than the default `top` command.

### Features
- **Interactive**: Click to select processes
- **Tree view**: See process hierarchy
- **Kill processes**: F9 to kill selected process
- **Search**: F3 to search processes
- **Sorting**: F6 to sort by different columns

### Commands Available
```bash
# Basic usage (now aliased to 'top')
htop

# With root privileges for all processes
sudo htop
```

### How to Test
```bash
# Try these:
top                     # Now uses htop - much better interface!
htop                    # Same result, more explicit
sudo htop               # See all system processes
```

---

## 10. Powerlevel10k - Beautiful Prompt

### What is Powerlevel10k?
Powerlevel10k is a fast, customizable zsh prompt with many features.

### Features
- **Git integration**: Shows git status, branch, changes
- **System info**: Shows Python/Node versions, time, etc.
- **Customizable**: Run `p10k configure` to customize
- **Fast**: Optimized for speed
- **Icons**: Beautiful icons for different states

### Configuration
- **File**: `~/.p10k.zsh`
- **Customize**: Run `p10k configure`

### How to Test
```bash
# Try these:
p10k configure          # Customize your prompt
# Navigate to a git repository to see git status
# Check different directories to see system info
```

---

## 11. Oh My Zsh Plugins

### Installed Plugins
- **zsh-autosuggestions**: Suggests commands as you type
- **zsh-syntax-highlighting**: Colors commands as you type
- **zsh-completions**: Enhanced tab completion
- **git**: Git aliases and functions
- **brew, macos, docker**: Platform-specific tools
- **colored-man-pages**: Colored manual pages
- **command-not-found**: Helpful suggestions for typos
- **extract**: Universal archive extractor
- **z**: Smart directory jumping

### How to Test
```bash
# Try these:
# Type a command and see suggestions appear
# Type a command and see syntax highlighting
# Use tab completion - it's much better now
# Type 'extract filename.zip' to extract archives
# Type 'z' to see frequently used directories
```

---

## 12. Conda Package Manager

### What is Conda?
Conda is a powerful package manager and environment management system for Python and other languages. It helps you manage dependencies and create isolated environments for different projects.

### What's Included
- **Miniconda**: Lightweight Conda distribution
- **Python 3.12**: Latest Python version in dedicated environment
- **Auto-activation**: Python 3.12 environment activates automatically
- **Conda aliases**: Short commands for common operations

### Key Features

#### Environment Management
```bash
# List all environments
ce                      # Shows all conda environments

# Activate/deactivate environments
ca py312               # Activate Python 3.12 environment
cda                    # Deactivate current environment

# Create new environments
cc myproject python=3.11  # Create new environment with Python 3.11
cc data-science python=3.12 pandas numpy matplotlib  # Create with packages
```

#### Package Management
```bash
# Install packages
ci numpy               # Install numpy
ci pandas matplotlib   # Install multiple packages
ci -c conda-forge jupyter  # Install from specific channel

# Search packages
csp tensorflow         # Search for packages
csp "machine learning" # Search with keywords

# Update packages
cup numpy              # Update numpy
cup --all              # Update all packages in environment

# Remove packages
cr pandas              # Remove pandas
```

#### Python Environment
- **Default Python**: Python 3.12.11 is active by default
- **Package isolation**: Each environment has its own packages
- **Dependency management**: Conda handles complex dependencies automatically

### How to Test
```bash
# Check versions
python --version        # Should show Python 3.12.11
conda --version         # Should show Conda version

# List environments
ce                      # Should show py312 as active

# Test package installation
ci requests            # Install requests package
python -c "import requests; print('Success!')"  # Test import

# Create test environment
cc test-env python=3.11
ca test-env
python --version        # Should show Python 3.11
cda                    # Deactivate test environment
```

### Benefits
1. **Isolated environments**: Keep project dependencies separate
2. **Easy package management**: Install complex packages with one command
3. **Version control**: Use different Python versions for different projects
4. **Dependency resolution**: Conda automatically resolves package conflicts
5. **Cross-platform**: Same commands work on macOS, Linux, and Windows

### Common Workflows

#### Starting a New Project
```bash
# Create project directory
mkcd my-new-project

# Create conda environment
cc my-new-project python=3.12

# Activate environment
ca my-new-project

# Install required packages
ci numpy pandas matplotlib jupyter

# Start coding!
code .                 # Open in VS Code
```

#### Working with Data Science
```bash
# Activate data science environment
ca data-science

# Install additional packages
ci scikit-learn seaborn plotly

# Start Jupyter
jupyter notebook
```

#### Managing Multiple Projects
```bash
# List all environments
ce

# Switch between projects
ca web-project         # Work on web project
ca ml-project         # Switch to ML project
ca data-analysis      # Switch to data analysis
```

---

## 13. Useful Aliases

### Navigation Aliases
```bash
..                      # Go up one directory
...                     # Go up two directories
....                    # Go up three directories
~                       # Go to home directory
-                       # Go to previous directory
```

### File Operation Aliases
```bash
ll                      # Detailed file listing with eza
la                      # List all files with eza
l                       # List files with eza
ls                      # List files with eza and icons
lt                      # Tree view with eza
lta                     # Tree view including hidden files
```

### Git Aliases
```bash
gs                      # git status
ga                      # git add
gc                      # git commit
gp                      # git push
gl                      # git pull
gd                      # git diff
gb                      # git branch
gco                     # git checkout
gcm                     # git checkout main
gcb                     # git checkout -b
gst                     # git stash
gsp                     # git stash pop
glog                    # git log --oneline --graph --decorate
lg                      # lazygit
```

### System Aliases
```bash
c                       # clear
h                       # history
sysinfo                 # system information
weather <city>          # weather information
myip                    # public IP address
localip                 # local IP address
```

### How to Test
```bash
# Try these aliases:
..                      # Go up one directory
ll                      # See detailed file listing
gs                      # Check git status
sysinfo                 # See system information
weather London          # Get weather for London
```

---

## 14. Custom Functions

### File Operations
```bash
fzf-open                # Fuzzy find and open files
fzf-cd                  # Fuzzy find and cd into directories
search <pattern>        # Search files with ripgrep + fzf
nav                     # Quick directory navigation
extract <file>          # Extract any archive format
backup <file>           # Create timestamped backup
```

### System Utilities
```bash
killport <port>         # Kill process using specific port
sysinfo                 # Display system information
weather <city>          # Get weather for city
mkcd <dir>              # Create directory and cd into it
```

### How to Test
```bash
# Try these functions:
fzf-open                # Find and open a file
search "function"       # Search for "function" in files
nav                     # Navigate to a directory
extract ~/Downloads/somefile.zip  # Extract an archive
backup ~/.zshrc         # Create a backup of .zshrc
killport 3000           # Kill process on port 3000
weather New York        # Get weather for New York
mkcd newproject         # Create and enter newproject directory
```

---

## 15. Keyboard Shortcuts

### FZF Shortcuts
- **Ctrl+T**: Search and insert files
- **Ctrl+R**: Search command history
- **Alt+C**: Search and cd into directories

### Terminal Shortcuts
- **Ctrl+L**: Clear screen
- **Ctrl+C**: Cancel current command
- **Ctrl+D**: Exit terminal

### How to Test
```bash
# Try these shortcuts:
Ctrl+T                  # Search for files
Ctrl+R                  # Search command history
Alt+C                   # Search for directories
```

---

## 🎯 Practice Exercises

### Exercise 1: File Operations
1. Use `ll` to see detailed file listing
2. Use `lt` to see tree view
3. Use `fzf-open` to find and open a file
4. Use `search "alias"` to find files containing "alias"

### Exercise 2: Git Operations
1. Use `lg` to open lazygit
2. Use `gs` to check git status
3. Use `glog` to see git history
4. Make a change and use `git diff` to see delta highlighting

### Exercise 3: System Information
1. Use `sysinfo` to see system information
2. Use `htop` to see running processes
3. Use `weather <your-city>` to get weather
4. Use `myip` to see your public IP

### Exercise 4: Navigation
1. Use `nav` to navigate directories
2. Use `..` to go up directories
3. Use `mkcd testdir` to create and enter a directory
4. Use `Ctrl+R` to search command history

---

## 🔧 Troubleshooting

### If something doesn't work:
1. Restart your terminal
2. Run `source ~/.zshrc`
3. Check if fonts are installed: `ls ~/Library/Fonts/ | grep JetBrains`
4. Verify Ghostty config: `cat ~/.config/ghostty/ghostty.conf`

### To update tools:
```bash
brew update && brew upgrade
```

### To reconfigure prompt:
```bash
p10k configure
```

---

## 🎉 Conclusion

Your Ghostty terminal is now a powerful, feature-rich development environment! Each tool has been carefully selected to enhance your productivity and make terminal work more enjoyable. Take time to practice with each feature, and soon you'll wonder how you ever worked without them!

---

*Happy coding! 🚀*