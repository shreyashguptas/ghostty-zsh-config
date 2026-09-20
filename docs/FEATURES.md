# 🚀 Ghostty Terminal Enhancements - Complete Guide

## Overview
This document explains the enhancements made to your Ghostty terminal and how to use them.

This setup is deliberately minimal. It does not install fzf, eza, bat, fd, ripgrep, lazygit, delta or htop, and it does not alias `ls`, `cat`, `find`, `grep` or `top` to anything else — those stay as the real system commands. What you get is a fast shell, a git-aware prompt, and inline autosuggestions.

---

## 📋 Table of Contents
1. [Multi-line Paste Fix](#1-multi-line-paste-fix)
2. [Powerlevel10k - The Prompt](#2-powerlevel10k---the-prompt)
3. [Oh My Zsh Plugins](#3-oh-my-zsh-plugins)
4. [Conda Package Manager](#4-conda-package-manager)
5. [Theme Management](#5-theme-management)
6. [Useful Aliases](#6-useful-aliases)
7. [Custom Functions](#7-custom-functions)
8. [Keyboard Shortcuts](#8-keyboard-shortcuts)

---

## 1. Multi-line Paste

### What Changed
- **Problem**: Ghostty was asking "Are you sure?" when pasting multi-line content
- **What actually fixes it**: `clipboard-paste-protection`. Earlier versions of
  this repo set `paste-multiline-mode` and `paste-multiline-delay`, which are
  **not real Ghostty settings** — they were silently rejected as unknown fields.

### Configuration
```ini
# In ~/.config/ghostty/config
clipboard-paste-protection = true
```

This is left at Ghostty's default of `true`. It only prompts for pastes that
are genuinely unsafe — text ending in a newline, which would execute the moment
it lands. Ordinary multi-line pastes go through silently via bracketed paste, so
the original annoyance is already gone.

If you want no prompt at all, set it to `false` — and know that pasted text
ending in a newline will run immediately.

### How to Test
1. Copy a multi-line script or text (no trailing newline)
2. Paste it into your terminal
3. It pastes immediately, with no prompt

---

## 2. Powerlevel10k - The Prompt

### What is Powerlevel10k?
Powerlevel10k is a fast zsh prompt. It is the main thing this config is built around.

### What the prompt shows
- **Current directory** on the left
- **Git status** whenever you are inside a repository:
  - the branch name
  - a marker when the working tree is dirty or has untracked files
  - **⇡N / ⇣N** — how many commits you are **ahead of / behind** the remote
  - stash count, merge/rebase state
- **Exit code** of the last command, if it failed
- **Command duration**, for anything slow
- **Active conda environment** (or virtualenv / node / go / rust version, when relevant)

### Why it is fast
- **Instant prompt**: `~/.zshrc` starts with the Powerlevel10k instant-prompt block, so the prompt draws immediately instead of waiting for the rest of the config to load.
- **Async git status**: git information is computed in the background — large repos never block your prompt.
- **Small plugin list**: only four Oh My Zsh plugins are loaded.

### Configuration
- **File**: `~/.p10k.zsh`
- **Customize**: Run `p10k configure`

### How to Test
```bash
cd ~/some-git-repo      # prompt shows the branch
touch newfile           # prompt now shows the dirty/untracked marker
git fetch               # prompt shows ⇡/⇣ if you are ahead of or behind the remote
p10k configure          # customize your prompt
```

---

## 3. Oh My Zsh Plugins

Only four plugins are enabled. Every extra plugin costs startup time, so the list is kept short on purpose.

- **zsh-autosuggestions**: The gray inline suggestion drawn from your history as you type. Press `→` to accept it. The strategy is set to `(history completion)`, so when history has no match it falls back to what tab completion would suggest.
- **zsh-syntax-highlighting**: Colors your command line as you type — valid commands go green, unknown ones red.
- **zsh-completions**: Extra completion definitions, so Tab knows about more commands.
- **git**: Git aliases and completions.

### How to Test
```bash
# Type the start of a command you have run before — a gray suggestion appears.
# Press → to accept it, or End to accept the whole thing.
# Type a bogus command like 'gti' — it stays red until it is a real command.
# Type 'git ' and press Tab to see git subcommands.
```

---

## 4. Conda Package Manager

> Optional. `install.sh` skips conda unless you pass `--with-conda`.

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

## 5. Theme Management

### What is Theme Management?
This setup includes dynamic theme switching that automatically adapts to your macOS system theme, providing optimal readability in both light and dark modes.

### Key Features
- **Automatic Detection**: Detects macOS system theme and switches accordingly
- **High Contrast Colors**: Optimized for readability in both light and dark modes
- **GitHub-Inspired Palette**: Professional color scheme
- **Git Integration**: Clear visual indicators for repository status
- **Conda Environment Display**: Visual indicators for active Python environments

### Theme Switching Commands

#### Automatic Theme Detection
```bash
# Auto-detect system theme and switch
theme

# Check current system theme
theme-status
```

#### Manual Theme Switching
```bash
# Switch to specific themes
theme-light    # Force light mode
theme-dark     # Force dark mode
theme-auto     # Auto-detect system theme

# Using the standalone script
./scripts/switch-theme.sh light
./scripts/switch-theme.sh dark
./scripts/switch-theme.sh auto
```

### Color Scheme Features

#### Dark Mode (Default)
- **Background**: GitHub dark theme (`#0d1117`)
- **Text**: High-contrast light text (`#e6edf3`)
- **Directory**: Blue background with white text
- **Git Status**: Green for clean, yellow for modified
- **Conda Environment**: Green background with white text

#### Light Mode
- **Background**: Clean white (`#ffffff`)
- **Text**: Dark text (`#24292f`)
- **Directory**: Blue background with white text
- **Git Status**: Dark green for clean, dark yellow for modified
- **Conda Environment**: Green background with white text

### Configuration Files
- **Dark Mode**: `configs/ghostty.conf`
- **Light Mode**: `configs/ghostty-light.conf`
- **Prompt Colors**: `configs/.p10k.zsh`

### How to Use

#### Initial Setup
```bash
# Copy configuration files
cp configs/ghostty.conf ~/.config/ghostty/
cp configs/.zshrc ~/
cp configs/.p10k.zsh ~/

# Make theme script executable
chmod +x scripts/switch-theme.sh

# Auto-detect and apply theme
./scripts/switch-theme.sh auto
```

#### Daily Usage
```bash
# Check current theme
theme-status

# Switch themes as needed
theme-light    # For bright environments
theme-dark     # For dark environments
theme          # Auto-detect and switch
```

### Benefits
1. **Better Readability**: High contrast colors in both modes
2. **Automatic Adaptation**: Switches with your system theme
3. **Professional Appearance**: GitHub-inspired color palette
4. **Clear Visual Hierarchy**: Different colors for different information types
5. **Accessibility**: High contrast ratios for better accessibility

---

## 6. Useful Aliases

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
ls                      # ls -G   (colored listing)
ll                      # ls -alFG (detailed, includes hidden files)
la                      # ls -AG  (all except . and ..)
l                       # ls -CFG (compact columns)
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
```

### System Aliases
```bash
c                       # clear
h                       # history
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
weather London          # Get weather for London
```

---

## 7. Custom Functions

### File Operations
```bash
extract <file>          # Extract any archive format
backup <file>           # Create timestamped backup
mkcd <dir>              # Create directory and cd into it
```

### System Utilities
```bash
killport <port>         # Kill process using specific port
weather <city>          # Get weather for city
ac-help                 # Print the autosuggestion/completion cheatsheet
```

### How to Test
```bash
extract ~/Downloads/somefile.zip  # Extract an archive
backup ~/.zshrc         # Create a backup of .zshrc
killport 3000           # Kill process on port 3000
weather New York        # Get weather for New York
mkcd newproject         # Create and enter newproject directory
ac-help                 # See the keyboard shortcuts
```

---

## 8. Keyboard Shortcuts

### Autosuggestions
- **→ (Right Arrow)**: Accept the suggestion one character at a time
- **End**: Accept the entire suggestion
- **Ctrl+→**: Accept the suggestion one word at a time
- **Ctrl+End**: Accept the entire suggestion

### Completion
- **Tab**: Complete the longest unambiguous prefix, then show the menu
- **Tab Tab**: Cycle through the options
- **Esc**: Cancel completion

### Terminal Shortcuts
- **Ctrl+R**: Search command history (zsh reverse search)
- **Ctrl+L**: Clear screen
- **Ctrl+C**: Cancel current command
- **Ctrl+D**: Exit terminal

### How to Test
```bash
ac-help                 # Prints all of the above in your terminal
```

---

## 🎯 Practice Exercises

### Exercise 1: Autosuggestions
1. Run a long command, e.g. `git log --oneline --graph --decorate`
2. Start typing `git log` again — the rest appears in gray
3. Press `→` to accept it one character at a time, then `End` to accept the rest
4. Run `ac-help` to see every shortcut

### Exercise 2: The Git Prompt
1. `cd` into any git repository and look at the branch in the prompt
2. Create a file — the prompt picks up the untracked marker
3. Commit it without pushing — the prompt shows `⇡1` (one commit ahead)
4. Run `git fetch` in a repo with new upstream commits — the prompt shows `⇣N`

### Exercise 3: Themes
1. Run `theme-status` to see whether macOS is in light or dark mode
2. Run `light`, then restart Ghostty
3. Run `dark`, then restart Ghostty
4. Run `theme-auto` to follow the system setting

### Exercise 4: Navigation and Files
1. Use `..` to go up directories
2. Use `mkcd testdir` to create and enter a directory
3. Use `ll` to see a detailed listing
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

Your Ghostty terminal is now a fast, quiet development environment: a prompt that tells you exactly where your repo stands, suggestions pulled from your own history, and a theme that follows macOS. Nothing shadows the standard commands, and nothing slows down your shell start.

---

*Happy coding! 🚀*