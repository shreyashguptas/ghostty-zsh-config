# 📋 Complete Alias and Function Reference

This document provides a comprehensive reference for all aliases and functions available in your enhanced Ghostty terminal setup.

## 🧭 Navigation Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `..` | `cd ..` | Go up one directory |
| `...` | `cd ../..` | Go up two directories |
| `....` | `cd ../../..` | Go up three directories |
| `.....` | `cd ../../../..` | Go up four directories |
| `~` | `cd ~` | Go to home directory |
| `-` | `cd -` | Go to previous directory |

## 📁 File Operation Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `ls -G` | List files with color |
| `ll` | `ls -alFG` | Detailed listing, including hidden files |
| `la` | `ls -AG` | List all files except `.` and `..` |
| `l` | `ls -CFG` | Compact column listing |

> `ls`, `cat`, `find`, `grep` and `top` are the real system commands — this setup does not shadow them with replacements.

## 🔧 Git Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `gs` | `git status` | Show git status |
| `ga` | `git add` | Stage files |
| `gc` | `git commit` | Commit changes |
| `gp` | `git push` | Push to remote |
| `gl` | `git pull` | Pull from remote |
| `gd` | `git diff` | Show differences |
| `gb` | `git branch` | List branches |
| `gco` | `git checkout` | Switch branches |
| `gcm` | `git checkout main` | Switch to main branch |
| `gcb` | `git checkout -b` | Create and switch to new branch |
| `gst` | `git stash` | Stash changes |
| `gsp` | `git stash pop` | Apply stash |
| `glog` | `git log --oneline --graph --decorate` | Beautiful git log |

## 📂 Directory Shortcuts

| Alias | Command | Description |
|-------|---------|-------------|
| `dev` | `cd ~/Development` | Go to Development directory |
| `docs` | `cd ~/Documents` | Go to Documents directory |
| `downloads` | `cd ~/Downloads` | Go to Downloads directory |
| `desktop` | `cd ~/Desktop` | Go to Desktop directory |

## 🖥️ System Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `c` | `clear` | Clear screen |
| `h` | `history` | Show command history |
| `j` | `jobs -l` | List jobs |
| `path` | `echo -e ${PATH//:/\\n}` | Show PATH variable |
| `now` | `date +"%T"` | Show current time |
| `nowtime` | `date +"%T"` | Show current time |
| `nowdate` | `date +"%d-%m-%Y"` | Show current date |

## 🌐 Network Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `ports` | `netstat -tulanp` | Show open ports |
| `myip` | `curl -s https://ipinfo.io/ip` | Show public IP |
| `localip` | `ipconfig getifaddr en0` | Show local IP |

## 🔄 Process Management Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `ps` | `ps auxf` | Show processes |
| `psgrep` | `ps aux \| grep -v grep \| grep -i -e VSZ -e` | Search processes |
| `psmem` | `ps auxf \| sort -nr -k 4` | Sort processes by memory |
| `pscpu` | `ps auxf \| sort -nr -k 3` | Sort processes by CPU |

## 📝 File Operation Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `mkdir` | `mkdir -pv` | Create directories with parents |
| `cp` | `cp -i` | Copy with confirmation |
| `mv` | `mv -i` | Move with confirmation |
| `rm` | `rm -i` | Remove with confirmation |
| `df` | `df -h` | Show disk usage in human format |
| `du` | `du -h` | Show directory size in human format |
| `free` | `free -m` | Show memory usage in MB |

## 🔍 Text Processing Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `grep` | `grep --color=auto` | Search with colors |
| `fgrep` | `fgrep --color=auto` | Fixed string search with colors |
| `egrep` | `egrep --color=auto` | Extended regex search with colors |
| `wget` | `wget -c` | Download with resume capability |

## 💻 Development Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `py` | `python` | Run Python (Conda environment) |
| `pip` | `pip` | Use pip (Conda environment) |
| `serve` | `python -m http.server` | Start HTTP server |
| `json` | `python -m json.tool` | Format JSON |

## 🐍 Conda Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `ca` | `conda activate` | Activate conda environment |
| `cda` | `conda deactivate` | Deactivate current environment |
| `ce` | `conda env list` | List all conda environments |
| `ci` | `conda install` | Install conda package |
| `cc` | `conda create` | Create new conda environment |
| `cr` | `conda remove` | Remove conda package |
| `cup` | `conda update` | Update conda package |
| `csp` | `conda search` | Search conda packages |
| `ccl` | `conda clean --all` | Clean all conda cache |
| `cci` | `conda clean --index-cache` | Clean conda index cache |
| `ccp` | `conda clean --packages` | Clean conda packages |
| `cct` | `conda clean --tarballs` | Clean conda tarballs |
| `ccf` | `conda clean --force-pkgs-dirs` | Force clean conda package directories |

## 🐍 Conda Functions

| Function | Description | Usage |
|----------|-------------|-------|
| `conda_info` | Show detailed conda environment information | `cinfo` |
| `conda_create_activate` | Create and activate new conda environment | `cca <env_name> [python_version]` |
| `conda_remove_env` | Remove conda environment safely | `crem <env_name>` |
| `conda_packages` | List packages in conda environment | `cpkg [env_name]` |
| `conda_export` | Export conda environment to requirements.txt | `cexp [env_name] [filename]` |

## 🎨 Theme Management

| Alias/Function | Description | Usage |
|----------------|-------------|-------|
| `theme` | Auto-detect and switch terminal theme | `theme` |
| `theme-light` | Switch to light mode | `theme-light` |
| `theme-dark` | Switch to dark mode | `theme-dark` |
| `theme-auto` | Auto-detect system theme | `theme-auto` |
| `theme-status` | Check current system theme | `theme-status` |
| `reload` | Reload terminal configuration | `reload` |
| `switch_theme` | Switch to specific theme | `switch_theme [light\|dark\|auto]` |

## 🍎 macOS Specific Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `showfiles` | `defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app` | Show hidden files |
| `hidefiles` | `defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app` | Hide hidden files |
| `flushdns` | `sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder` | Flush DNS cache |

## 🛠️ Custom Functions

### File Operations

#### `mkcd <directory>`
Create directory and cd into it.
```bash
mkcd newproject
# Creates newproject directory and changes into it
```

#### `extract <file>`
Extract any archive format.
```bash
extract file.zip
extract file.tar.gz
extract file.rar
# Automatically detects format and extracts
```

#### `backup <file>`
Create timestamped backup of a file.
```bash
backup ~/.zshrc
# Creates ~/.zshrc.backup.20241206_143022
```

### System Utilities

#### `killport <port>`
Kill process using specific port.
```bash
killport 3000
killport 8080
# Kills process running on specified port
```

#### `weather <city>`
Get weather information for a city.
```bash
weather London
weather "New York"
weather Tokyo
# Shows weather information for specified city
```

## ⌨️ Keyboard Shortcuts

### Autosuggestions and Completion
- **→ (Right Arrow)**: Accept the suggestion one character at a time
- **End**: Accept the entire suggestion
- **Ctrl+→**: Accept the suggestion one word at a time
- **Ctrl+End**: Accept the entire suggestion
- **Tab**: Complete the longest unambiguous prefix, then show the menu
- **Ctrl+R**: Search command history (zsh built-in reverse search)

Run `ac-help` at any time to print this list in your terminal.

### Terminal Shortcuts
- **Ctrl+L**: Clear screen
- **Ctrl+C**: Cancel current command
- **Ctrl+D**: Exit terminal
- **Ctrl+Z**: Suspend current process

## 🎯 Usage Examples

### Daily Workflow
```bash
# Navigate quickly
..                      # Go up one level
dev                     # Go to Development folder

# Work with files
ll                      # See files, including hidden ones
grep -rn "TODO" .       # Find TODO comments

# Git workflow
gs                      # Check status
ga .                    # Stage all changes
gc -m "Add feature"     # Commit changes
glog                    # See the history as a graph

# Misc
weather London          # Check weather
top                     # Monitor processes
```

### Development Workflow
```bash
# Create new project
mkcd myproject          # Create and enter project directory
git init                # Initialize git repository

# Work with code
grep -rn "function" .   # Find functions
cat main.py             # View a file

# Manage processes
killport 3000           # Kill development server
top                     # Monitor system resources
```

### Python and Conda Workflow
```bash
# Check Python and Conda versions
python --version        # Check Python version (3.12.11)
conda --version         # Check Conda version

# Manage conda environments
ce                      # List all environments
ca py312               # Activate Python 3.12 environment
cc myenv python=3.11   # Create new environment with Python 3.11

# Install packages
ci numpy               # Install numpy with conda
ci pandas matplotlib   # Install multiple packages
ci -c conda-forge jupyter  # Install from specific channel

# Search and manage packages
csp tensorflow         # Search for packages
cup numpy              # Update numpy
cr pandas              # Remove pandas

# Deactivate environment
cda                    # Deactivate current environment
```

## 💡 Pro Tips

1. **Autosuggestions**: Start typing a command you've run before, then press `→` to accept the gray suggestion
2. **Prompt**: The prompt shows your branch, whether the tree is dirty, and how many commits you are ahead/behind the remote
3. **Git workflow**: The short aliases (`gs`, `ga`, `gc`, `gp`) cover most day-to-day git use
4. **File operations**: Use `ll` instead of `ls` for more information
5. **History**: `Ctrl+R` searches your command history
6. **Weather**: Use `weather` for quick weather checks
7. **Backup**: Use `backup` before making important changes
8. **Conda environments**: Use `ce` to see all environments, `ca` to activate
9. **Python packages**: Use `ci` for conda installs, `csp` to search packages
10. **Environment management**: Create project-specific environments with `cc`

---

*This reference covers all aliases and functions in your enhanced terminal setup. Use `alias` to see all current aliases and `type <function_name>` to see function definitions.*