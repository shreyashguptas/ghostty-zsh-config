# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Powerlevel10k prompt: directory + git status (branch, dirty state, ahead/behind).
ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_CUSTOM="$ZSH/custom"

# Which plugins would you like to load?
# Kept deliberately small — every plugin adds startup time.
#   git                    - git aliases and completions
#   zsh-autosuggestions    - the gray inline suggestion from history
#   zsh-syntax-highlighting - colors commands as you type
#   zsh-completions        - extra completion definitions for Tab
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

# Autosuggestion strategy: try history first, then fall back to what tab
# completion would suggest. The `completion` strategy needs the zsh/zpty module
# (present in a standard zsh); without it, history-only suggestions still work.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source $ZSH/oh-my-zsh.sh

# User configuration

# ===== TERMINAL COMPATIBILITY FOR SSH =====
# Fix Ghostty terminal compatibility when SSHing into remote devices
# Ghostty reports itself as "Ghostty" which remote systems don't recognize
# Set TERM to a compatible value that works everywhere
if [[ -n "$TERM_PROGRAM" ]] && [[ "$TERM_PROGRAM" == "Ghostty" ]]; then
    # We're running in Ghostty terminal
    # Set TERM to xterm-256color which is widely supported by remote systems
    export TERM="xterm-256color"
elif [[ "$TERM" == "Ghostty" ]] || [[ "$TERM" == *"ghostty"* ]]; then
    # Fallback: check if TERM itself contains ghostty
    export TERM="xterm-256color"
fi

# Ensure TERM is set even if not detected above (for SSH sessions)
# This ensures compatibility when SSHing from Ghostty to remote systems
if [[ -z "$TERM" ]] || [[ "$TERM" == "unknown" ]]; then
    export TERM="xterm-256color"
fi

# Auto-tint Ghostty tabs by SSH host (deterministic color per hostname)
[[ -f ~/.ghostty-ssh-colors.zsh ]] && source ~/.ghostty-ssh-colors.zsh

# ===== CUSTOM CONFIGURATION =====

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# ===== COMPLETION =====
# Note: Oh My Zsh already runs compinit, so we don't run it again here.
# These zstyles just tune how the completion menu looks and behaves.

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Case-insensitive and partial-word completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' expand prefix suffix

# ===== USEFUL ALIASES =====

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# List files (built-in ls with colors)
alias ls='ls -G'
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcm='git checkout main'
alias gcb='git checkout -b'
alias gst='git stash'
alias gsp='git stash pop'
alias glog='git log --oneline --graph --decorate'

# Directory shortcuts
alias dev='cd ~/Development'
alias docs='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'

# System shortcuts
alias c='clear'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Network shortcuts
alias ports='netstat -tulanp'
alias myip='curl -s https://ipinfo.io/ip'
alias localip='ipconfig getifaddr en0'

# Process management
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# File operations
alias mkdir='mkdir -pv'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias free='free -m'

# Text processing
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias wget='wget -c'

# Development shortcuts
alias py='python'
alias pip='pip'
alias serve='python -m http.server'
alias json='python -m json.tool'

# Conda shortcuts
alias ca='conda activate'
alias cda='conda deactivate'
alias ce='conda env list'
alias ci='conda install'
alias cc='conda create'
alias cr='conda remove'
alias cup='conda update'
alias csp='conda search'
alias ccl='conda clean --all'
alias cci='conda clean --index-cache'
alias ccp='conda clean --packages'
alias cct='conda clean --tarballs'
alias ccf='conda clean --force-pkgs-dirs'

# Additional conda function aliases
alias cinfo='conda_info'
alias cca='conda_create_activate'
alias crem='conda_remove_env'
alias cpkg='conda_packages'
alias cexp='conda_export'

# Theme management aliases
alias theme='switch_terminal_theme'
alias theme-light='switch_theme light'
alias theme-dark='switch_theme dark'
alias theme-auto='switch_theme auto'
alias light='switch_theme light'
alias dark='switch_theme dark'
alias reload='reload_terminal'
alias theme-status='echo "🌙 Current system theme: $(is_dark_mode && echo "Dark" || echo "Light")"'

# Help aliases
alias autocomplete-help='autocomplete_help'
alias ac-help='autocomplete_help'

# macOS specific
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# ===== USEFUL FUNCTIONS =====

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find and kill process on a port
killport() {
    lsof -ti:$1 | xargs kill -9
}

# Weather
weather() {
    curl -s "wttr.in/$1"
}

# Quick backup
backup() {
    command cp "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
}

# ===== THEME MANAGEMENT FUNCTIONS =====
# Ghostty reads ~/.config/ghostty/config (a file literally named "config").
# install.sh drops both palettes into ~/.config/ghostty/themes/, so switching is
# just a copy — it does not need the repo to be checked out or the cwd to be
# anywhere in particular.
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
GHOSTTY_THEME_DIR="$GHOSTTY_CONFIG_DIR/themes"

# Function to detect macOS appearance mode
is_dark_mode() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        local mode=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
        [[ "$mode" == "Dark" ]]
    else
        # Default to dark mode for non-macOS systems
        return 0
    fi
}

# Apply one of the installed palettes (dark|light)
_apply_ghostty_theme() {
    local theme="$1"
    local src="$GHOSTTY_THEME_DIR/$theme.conf"

    if [[ ! -f "$src" ]]; then
        echo "❌ Theme file not found: $src"
        echo "💡 Run ./scripts/install.sh to install the theme files"
        return 1
    fi

    # `command` bypasses the cp -i / mkdir -pv aliases defined above, which are
    # baked into this function body at definition time and would otherwise
    # prompt "overwrite?" on every theme switch after the first.
    command mkdir -p "$GHOSTTY_CONFIG_DIR"
    command cp "$src" "$GHOSTTY_CONFIG_DIR/config" || return 1

    if [[ "$theme" == "dark" ]]; then
        echo "🌙 Switched to dark mode!"
    else
        echo "☀️ Switched to light mode!"
    fi
    echo "💡 Press Cmd+Shift+, in Ghostty to reload, or restart it"
}

# Switch to a specific theme: light, dark, or auto (follow macOS)
switch_theme() {
    case "${1:-auto}" in
        light) _apply_ghostty_theme light ;;
        dark)  _apply_ghostty_theme dark  ;;
        auto)
            if is_dark_mode; then
                _apply_ghostty_theme dark
            else
                _apply_ghostty_theme light
            fi
            ;;
        *)
            echo "Usage: switch_theme [light|dark|auto]"
            return 1
            ;;
    esac
}

# Follow whatever macOS is currently set to
switch_terminal_theme() {
    switch_theme auto
}

switch_to_light() {
    _apply_ghostty_theme light
}

switch_to_dark() {
    _apply_ghostty_theme dark
}

# Function to reload terminal configuration
reload_terminal() {
    echo "🔄 Reloading terminal configuration..."
    # Reload ZSH configuration
    source ~/.zshrc
    echo "✅ ZSH configuration reloaded!"
    echo "💡 Restart Ghostty to apply new color scheme"
}

# Function to explain autocomplete and autosuggestion usage
autocomplete_help() {
    echo "🔍 Autocomplete and Autosuggestion Guide"
    echo "========================================"
    echo ""
    echo "📝 AUTOSUGGESTIONS (gray text that appears as you type):"
    echo "  • Right Arrow (→)     - Accept character by character"
    echo "  • End key             - Accept entire suggestion"
    echo "  • Ctrl+Right Arrow    - Accept word by word"
    echo "  • Ctrl+End            - Accept entire suggestion"
    echo ""
    echo "⌨️  TAB COMPLETION (press Tab to see options):"
    echo "  • Tab                 - Show completion menu"
    echo "  • Tab Tab             - Cycle through options"
    echo "  • Enter               - Select highlighted option"
    echo "  • Esc                 - Cancel completion"
    echo ""
    echo "💡 TIPS:"
    echo "  • Autosuggestions are based on your command history"
    echo "  • Tab completion shows available commands/files"
    echo "  • Use Right Arrow to accept autosuggestions"
    echo "  • Use Tab to see completion options"
    echo ""
    echo "🧪 TRY THIS:"
    echo "  1. Type 'git ' and press Tab to see git commands"
    echo "  2. Type 'ls ' and press Tab to see files/directories"
    echo "  3. Type 'conda ' and press Right Arrow to accept suggestion"
}

# ===== CONDA FUNCTIONS =====

# Show current conda environment info
conda_info() {
    echo "=== Conda Environment Information ==="
    echo "Current environment: $(conda info --envs | grep '*' | awk '{print $1}')"
    echo "Python version: $(python --version 2>/dev/null || echo 'Not available')"
    echo "Conda version: $(conda --version)"
    echo ""
    echo "Available environments:"
    conda env list
}

# Create and activate a new conda environment
conda_create_activate() {
    if [ -z "$1" ]; then
        echo "Usage: conda_create_activate <env_name> [python_version]"
        return 1
    fi
    local env_name="$1"
    local python_version="${2:-3.12}"
    conda create -n "$env_name" python="$python_version" -y
    conda activate "$env_name"
    echo "Created and activated environment: $env_name with Python $python_version"
}

# Deactivate and remove conda environment
conda_remove_env() {
    if [ -z "$1" ]; then
        echo "Usage: conda_remove_env <env_name>"
        return 1
    fi
    local env_name="$1"
    conda deactivate 2>/dev/null || true
    conda env remove -n "$env_name"
    echo "Removed environment: $env_name"
}

# Show conda environment packages
conda_packages() {
    local env="${1:-$(conda info --envs | grep '*' | awk '{print $1}')}"
    echo "=== Packages in environment: $env ==="
    conda list -n "$env"
}

# Export conda environment to requirements.txt
conda_export() {
    local env="${1:-$(conda info --envs | grep '*' | awk '{print $1}')}"
    local filename="${2:-requirements.txt}"
    conda list -n "$env" --export > "$filename"
    echo "Exported environment $env to $filename"
}

# ===== ENVIRONMENT VARIABLES =====
export EDITOR='code'
export VISUAL='code'
export BROWSER='open'

export PATH="$HOME/.local/bin:$PATH"

# ===== AUTOCOMPLETE AND AUTOSUGGESTION KEY BINDINGS =====
# Accept autosuggestion with Right Arrow (character by character)
bindkey '^[[C' forward-char

# Accept autosuggestion with End key (accept entire suggestion)
bindkey '^[[F' end-of-line

# Accept autosuggestion with Ctrl+Right Arrow (word by word)
bindkey '^[[1;5C' forward-word

# Accept autosuggestion with Ctrl+End (accept entire suggestion)
bindkey '^[[1;5F' end-of-line

# Tab completes the longest unambiguous prefix, then shows the menu
bindkey '^I' expand-or-complete-prefix

# ===== POWERLEVEL10K CONFIGURATION =====
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===== CONDA INITIALIZATION =====
# Sourcing conda.sh directly is much faster than `conda shell.zsh hook`,
# which spawns a Python process on every shell start.
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
elif [ -d "$HOME/miniconda3/bin" ]; then
    export PATH="$HOME/miniconda3/bin:$PATH"
fi

# Auto-activate Python 3.12 environment (only if it exists)
if command -v conda &> /dev/null && [ -d "$HOME/miniconda3/envs/py312" ]; then
    conda activate py312
fi
