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

# Confirm the exact family name macOS reports — it is NOT "JetBrains Mono
# Nerd Font". The cask installs it as "JetBrainsMono Nerd Font Mono".
ghostty +list-fonts | grep -i jetbrains

# Then set that exact name in ~/.config/ghostty/config:
#   font-family = JetBrainsMono Nerd Font Mono
```

### 3. Autosuggestions Not Appearing

**Problem**: No gray suggestion appears as you type.

**Solutions**:
```bash
# Check the plugin is installed
ls ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# If missing, install it
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Confirm it is in the plugins list in ~/.zshrc
grep -A6 '^plugins=' ~/.zshrc

# Reload configuration
source ~/.zshrc
```

Suggestions come from your command history, so a brand-new history has nothing
to suggest yet. Run a few commands and try again.

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

### 9. Prompt Not Showing Git Status or Ahead/Behind Counts

**Problem**: You're inside a repository but the prompt shows no branch, or no `⇡`/`⇣` counts.

**Solutions**:
```bash
# Confirm you are actually in a repository
git rev-parse --is-inside-work-tree

# Ahead/behind counts need an upstream branch to compare against
git rev-parse --abbrev-ref @{upstream}

# If that errors, set one:
git branch --set-upstream-to=origin/main

# install.sh sets push.autoSetupRemote so this happens on first push.
# Check it is on:
git config --global --get push.autoSetupRemote

# The counts only update against what git already knows locally.
# Fetch to refresh them:
git fetch
```

If the branch shows but the icons are wrong boxes, the Nerd Font is not being
used — see issue #2 above.

### 10. Theme Commands Do Nothing

**Problem**: `light`, `dark` or `theme` report success but Ghostty looks unchanged.

**Solutions**:
```bash
# Ghostty reads a file literally named "config" — not "ghostty.conf".
# Confirm the file exists and is the one being written:
ls -la ~/.config/ghostty/config

# Confirm both palettes are installed:
ls ~/.config/ghostty/themes/    # should list dark.conf and light.conf

# If themes/ is missing, re-run the installer:
./scripts/install.sh

# Ghostty only re-reads its config on reload:
#   press Cmd+Shift+, in Ghostty, or restart it

# Check what Ghostty actually loaded:
ghostty +show-config | grep -E "background|font-family"
```

Note that a stray `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`
is **not** read by Ghostty either — that path needs a file named `config` too.

### 11. Slow Terminal Startup

**Problem**: Terminal takes a long time to start.

**Solutions**:
```bash
# Measure it
time zsh -i -c exit

# Check the plugin list is still short — every plugin costs startup time.
# This config intentionally loads only four:
grep -A6 '^plugins=' ~/.zshrc

# Confirm the instant prompt block is still the FIRST thing in ~/.zshrc
head -6 ~/.zshrc

# Conda is often the slowest part. This config sources conda.sh directly
# instead of running `conda shell.zsh hook`, which spawns a Python process.
# If `conda init zsh` re-added that block, remove it:
grep -n "conda initialize" ~/.zshrc

# To profile in detail, add `zmodload zsh/zprof` at the top of ~/.zshrc
# and `zprof` at the bottom, then open a new shell.
```

## 🔍 Diagnostic Commands

### Check Installation Status
```bash
# Check if everything is installed
echo "=== Checking Tools ==="
which ghostty && echo "✅ Ghostty" || echo "❌ Ghostty"
which brew && echo "✅ Homebrew" || echo "❌ Homebrew"
which git && echo "✅ git" || echo "❌ git"
which conda && echo "✅ conda" || echo "❌ conda"

echo "=== Checking Plugins ==="
for p in zsh-autosuggestions zsh-syntax-highlighting zsh-completions; do
  [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$p" ] \
    && echo "✅ $p" || echo "❌ $p"
done
[ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ] \
  && echo "✅ powerlevel10k" || echo "❌ powerlevel10k"

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

### Check Startup Time
```bash
# A healthy startup with this config is well under half a second
time zsh -i -c exit
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
# Test Oh My Zsh
echo $ZSH

# Test Powerlevel10k
echo $POWERLEVEL9K_VERSION

# Test aliases
alias | grep -E "^(ll|la|gs|gd)="

# Test autosuggestions is loaded
echo $ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE
```

### Common Error Messages

#### "No such file or directory: .oh-my-zsh"
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

#### "fatal: not a git repository"
```bash
# This is normal if you're not in a git repository.
# The prompt simply omits the git segment outside of repositories.
```

#### "command not found: eza" / "bat" / "fzf" / "lazygit"
```bash
# Expected. This config deliberately does not install those tools,
# and does not alias ls/cat/find/grep/top to them.
# Use the standard commands instead: ls, cat, find, grep, top.
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