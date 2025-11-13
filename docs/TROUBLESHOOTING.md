# 🐛 Troubleshooting Guide

This guide helps you resolve common issues with your Ghostty ZSH configuration setup.

## 🔧 Common Issues and Solutions

### 1. Terminal Not Loading New Configuration

**Problem**: After installation, your terminal still shows the old configuration.

**Solutions**:
```bash
# Restart your terminal completely
# Or reload the configuration
source ~/.zshrc

# If that doesn't work, check if the file exists
ls -la ~/.zshrc

# Check if Oh My Zsh is installed
ls -la ~/.oh-my-zsh
```

### 2. Fonts Not Displaying Icons

**Problem**: Icons are not showing in the terminal (showing as squares or question marks).

**Solutions**:
```bash
# Check if fonts are installed
ls ~/Library/Fonts/ | grep JetBrains

# If not installed, install them
brew install --cask font-jetbrains-mono-nerd-font

# Restart Ghostty after installing fonts
# In Ghostty preferences, set font to "JetBrains Mono Nerd Font"
```

### 3. FZF Not Working

**Problem**: Fuzzy finder (fzf) is not working or not installed.

**Solutions**:
```bash
# Check if fzf is installed
which fzf

# If not installed
brew install fzf

# Set up fzf
$(brew --prefix)/opt/fzf/install --all

# Reload configuration
source ~/.zshrc
```

### 4. Oh My Zsh Plugins Not Loading

**Problem**: Plugins like autosuggestions or syntax highlighting are not working.

**Solutions**:
```bash
# Check if plugins are installed
ls ~/.oh-my-zsh/custom/plugins/

# Reinstall missing plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Reload configuration
source ~/.zshrc
```

### 5. Powerlevel10k Prompt Not Showing

**Problem**: The prompt is not showing the Powerlevel10k theme.

**Solutions**:
```bash
# Check if Powerlevel10k is installed
ls ~/.oh-my-zsh/custom/themes/powerlevel10k

# If not installed
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Check .zshrc configuration
grep "ZSH_THEME" ~/.zshrc

# Should show: ZSH_THEME="powerlevel10k/powerlevel10k"

# Reload configuration
source ~/.zshrc

# Configure the prompt
p10k configure
```

### 6. Multi-line Paste Still Asking "Are you sure?"

**Problem**: Ghostty is still asking for confirmation when pasting multi-line content.

**Solutions**:
```bash
# Check if ghostty config exists
ls -la ~/.config/ghostty/ghostty.conf

# If not, copy it from the repository
cp ~/Documents/GitHub/ghostty-zsh-config/configs/ghostty.conf ~/.config/ghostty/

# Restart Ghostty completely
# The configuration should take effect immediately
```

### 7. SSH Terminal Compatibility Issues

**Problem**: When SSHing into remote devices, you see errors like "extern Ghostty unknown unknown terminal type" or commands like `clear` don't work properly.

**Solutions**:
```bash
# Check current TERM variable
echo $TERM

# The .zshrc configuration should automatically set TERM to xterm-256color
# If it's not working, reload your configuration
source ~/.zshrc

# Verify TERM is set correctly
echo $TERM
# Should show: xterm-256color

# For SSH connections, ensure TERM is passed through
# Copy the SSH config template (optional but recommended)
mkdir -p ~/.ssh
cp ~/Documents/GitHub/ghostty-zsh-config/configs/ssh_config ~/.ssh/config

# Or manually add to ~/.ssh/config:
# Host *
#     SendEnv TERM
```

**What This Fixes**:
- Ghostty terminal reports itself as "Ghostty" which remote systems don't recognize
- The configuration automatically sets TERM to `xterm-256color` which is widely supported
- This ensures commands like `clear`, `vim`, `nano`, etc. work correctly over SSH
- Multi-line pasting and other terminal features work the same way on remote systems

**Testing**:
```bash
# SSH into a remote device
ssh user@remote-host

# After connecting, check TERM
echo $TERM
# Should show: xterm-256color

# Test commands
clear  # Should work without errors
vim    # Should open properly
```

### 8. Aliases Not Working

**Problem**: Custom aliases like `ll`, `lg`, etc. are not working.

**Solutions**:
```bash
# Check if aliases are defined
alias | grep ll

# If not, reload configuration
source ~/.zshrc

# Check if .zshrc has the aliases
grep "alias ll" ~/.zshrc
```

### 9. Git Delta Not Working

**Problem**: Git diffs are not showing with delta highlighting.

**Solutions**:
```bash
# Check git configuration
git config --global core.pager

# Should show: delta

# If not, configure delta
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Monokai Extended"
```

### 10. Tools Not Found (bat, eza, fd, etc.)

**Problem**: Commands like `bat`, `eza`, `fd` are not found.

**Solutions**:
```bash
# Check if tools are installed
which bat
which eza
which fd

# If not installed
brew install bat eza fd ripgrep tree htop lazygit delta

# Check PATH
echo $PATH

# Should include Homebrew paths
# For Apple Silicon: /opt/homebrew/bin
# For Intel: /usr/local/bin
```

### 11. Slow Terminal Startup

**Problem**: Terminal takes a long time to start.

**Solutions**:
```bash
# Check what's loading slowly
time zsh -i -c exit

# Check .zshrc for slow operations
# Look for network calls or heavy operations

# Disable some plugins temporarily to identify the issue
# Comment out plugins in ~/.zshrc and test
```

## 🔍 Diagnostic Commands

### Check Installation Status
```bash
# Check if all tools are installed
echo "=== Checking Tools ==="
which ghostty && echo "✅ Ghostty" || echo "❌ Ghostty"
which brew && echo "✅ Homebrew" || echo "❌ Homebrew"
which fzf && echo "✅ fzf" || echo "❌ fzf"
which bat && echo "✅ bat" || echo "❌ bat"
which eza && echo "✅ eza" || echo "❌ eza"
which fd && echo "✅ fd" || echo "❌ fd"
which rg && echo "✅ ripgrep" || echo "❌ ripgrep"
which lazygit && echo "✅ lazygit" || echo "❌ lazygit"
which delta && echo "✅ delta" || echo "❌ delta"
which htop && echo "✅ htop" || echo "❌ htop"

echo "=== Checking Configuration ==="
ls -la ~/.zshrc && echo "✅ .zshrc exists" || echo "❌ .zshrc missing"
ls -la ~/.config/ghostty/ghostty.conf && echo "✅ ghostty.conf exists" || echo "❌ ghostty.conf missing"
ls -la ~/.p10k.zsh && echo "✅ .p10k.zsh exists" || echo "❌ .p10k.zsh missing"
ls -la ~/.oh-my-zsh && echo "✅ Oh My Zsh exists" || echo "❌ Oh My Zsh missing"

echo "=== Checking Fonts ==="
ls ~/Library/Fonts/ | grep JetBrains && echo "✅ JetBrains fonts installed" || echo "❌ JetBrains fonts missing"
```

### Check Shell Configuration
```bash
# Check current shell
echo $SHELL

# Check zsh version
zsh --version

# Check Oh My Zsh version
cat ~/.oh-my-zsh/oh-my-zsh.sh | head -1
```

### Check Git Configuration
```bash
# Check git configuration
git config --global --list | grep delta
git config --global core.pager
```

## 🚨 Emergency Reset

If everything is broken and you need to start fresh:

```bash
# Backup current configuration
mkdir ~/backup-$(date +%Y%m%d)
cp ~/.zshrc ~/backup-$(date +%Y%m%d)/
cp -r ~/.oh-my-zsh ~/backup-$(date +%Y%m%d)/
cp -r ~/.config ~/backup-$(date +%Y%m%d)/

# Remove current configuration
rm ~/.zshrc
rm -rf ~/.oh-my-zsh
rm -rf ~/.config/ghostty

# Run the installation script again
cd ~/Documents/GitHub/ghostty-zsh-config
./scripts/install.sh
```

## 📞 Getting Help

### Check Logs
```bash
# Check zsh startup logs
zsh -x 2>&1 | head -20

# Check for errors in .zshrc
zsh -n ~/.zshrc
```

### Test Individual Components
```bash
# Test fzf
fzf --version

# Test Oh My Zsh
echo $ZSH

# Test Powerlevel10k
echo $POWERLEVEL9K_VERSION

# Test aliases
alias | grep -E "(ll|lg|bat|eza)"
```

### Common Error Messages

#### "command not found: fzf"
```bash
brew install fzf
$(brew --prefix)/opt/fzf/install --all
```

#### "zsh: command not found: bat"
```bash
brew install bat
```

#### "No such file or directory: .oh-my-zsh"
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

#### "fatal: not a git repository"
```bash
# This is normal if you're not in a git repository
# Use 'lg' command to initialize git in a directory
```

## 🎯 Quick Fixes

### Reset Everything
```bash
# Quick reset script
cd ~/Documents/GitHub/ghostty-zsh-config
chmod +x scripts/install.sh
./scripts/install.sh
```

### Update Everything
```bash
# Update all tools
cd ~/Documents/GitHub/ghostty-zsh-config
chmod +x scripts/update.sh
./scripts/update.sh
```

### Reconfigure Prompt
```bash
# Reconfigure Powerlevel10k
p10k configure
```

---

*If you're still having issues after trying these solutions, please create an issue in the GitHub repository with detailed information about your system and the specific error messages you're seeing.*