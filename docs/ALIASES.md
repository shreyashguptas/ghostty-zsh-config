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
| `ll` | `eza -alF --icons` | Detailed file listing with icons |
| `la` | `eza -A --icons` | List all files with icons |
| `l` | `eza -CF --icons` | List files with icons |
| `ls` | `eza --icons` | List files with icons (replaces ls) |
| `lt` | `eza --tree --level=2 --icons` | Tree view of current directory |
| `lta` | `eza --tree --level=2 --all --icons` | Tree view including hidden files |

## 🔍 Search and View Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `cat` | `bat` | Syntax-highlighted file viewing |
| `find` | `fd` | Fast file search |
| `grep` | `rg` | Lightning-fast text search |
| `top` | `htop` | Enhanced process viewer |

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
| `lg` | `lazygit` | Beautiful git interface |

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
| `py` | `python3` | Run Python 3 |
| `pip` | `pip3` | Use pip3 |
| `serve` | `python3 -m http.server` | Start HTTP server |
| `json` | `python3 -m json.tool` | Format JSON |

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

#### `fzf-open`
Fuzzy find and open files.
```bash
fzf-open
# Opens fuzzy finder to select and open files
```

#### `fzf-cd`
Fuzzy find and cd into directories.
```bash
fzf-cd
# Opens fuzzy finder to select and navigate to directories
```

#### `search <pattern>`
Search files with ripgrep + fzf.
```bash
search "function"
search "import"
# Searches for pattern in files with preview
```

#### `nav`
Quick directory navigation.
```bash
nav
# Opens fuzzy finder for directory navigation
```

### System Utilities

#### `killport <port>`
Kill process using specific port.
```bash
killport 3000
killport 8080
# Kills process running on specified port
```

#### `sysinfo`
Display system information.
```bash
sysinfo
# Shows system information, memory usage, and disk usage
```

#### `weather <city>`
Get weather information for a city.
```bash
weather London
weather "New York"
weather Tokyo
# Shows weather information for specified city
```

#### `fzf-git-log`
Fuzzy find in git history.
```bash
fzf-git-log
# Opens fuzzy finder to search git history
```

## ⌨️ Keyboard Shortcuts

### FZF Integration
- **Ctrl+T**: Search and insert files
- **Ctrl+R**: Search command history
- **Alt+C**: Search and cd into directories

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
nav                     # Fuzzy navigate

# Work with files
ll                      # See files with icons
fzf-open                # Find and open files
search "TODO"           # Find TODO comments

# Git workflow
gs                      # Check status
ga .                    # Stage all changes
gc -m "Add feature"     # Commit changes
lg                      # Use beautiful git interface

# System monitoring
sysinfo                 # Check system status
htop                    # Monitor processes
weather London          # Check weather
```

### Development Workflow
```bash
# Create new project
mkcd myproject          # Create and enter project directory
lg                      # Initialize git repository

# Work with code
search "function"       # Find functions
fzf-open                # Open files quickly
cat main.py             # View with syntax highlighting

# Manage processes
killport 3000           # Kill development server
htop                    # Monitor system resources
```

## 💡 Pro Tips

1. **Use fuzzy finders**: `fzf-open`, `nav`, `Ctrl+T` are much faster than traditional navigation
2. **Git workflow**: Use `lg` for complex git operations, aliases for simple ones
3. **File operations**: Use `ll` instead of `ls` for better information
4. **Search**: Use `search` instead of `grep` for interactive searching
5. **System info**: Use `sysinfo` for quick system overview
6. **Weather**: Use `weather` for quick weather checks
7. **Backup**: Use `backup` before making important changes

---

*This reference covers all aliases and functions in your enhanced terminal setup. Use `alias` to see all current aliases and `type <function_name>` to see function definitions.*