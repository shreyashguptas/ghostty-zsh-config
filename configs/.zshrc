# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM="$ZSH/custom"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    brew
    macos
    docker
    docker-compose
    node
    npm
    python
    pip
    conda
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    colored-man-pages
    command-not-found
    copyfile
    copypath
    dirhistory
    history
    sudo
    web-search
    extract
    z
)

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
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

# Auto-completion
autoload -U compinit && compinit

# Enhanced completion settings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Partial completion
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

# List files with colors and details (using eza for better output)
alias ll='eza -alF --icons'
alias la='eza -A --icons'
alias l='eza -CF --icons'
alias ls='eza --icons'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=2 --all --icons'

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
alias lg='lazygit'

# Better alternatives
alias cat='bat'
alias find='fd'
alias grep='rg'
alias top='htop'

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
alias cact='conda_activate'
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

# Find and kill process
killport() {
    lsof -ti:$1 | xargs kill -9
}

# Weather
weather() {
    curl -s "wttr.in/$1"
}

# Quick backup
backup() {
    cp "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
}

# Fuzzy find and open files
fzf-open() {
    local file
    file=$(fzf --preview 'bat --color=always --style=header,grid --line-range :300 {}')
    [ -n "$file" ] && ${EDITOR:-code} "$file"
}

# Fuzzy find and cd into directories
fzf-cd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

# Fuzzy find in git history
fzf-git-log() {
    git log --oneline --graph --decorate | fzf --preview 'git show --color=always {1}' | cut -d' ' -f1 | xargs git show
}

# System info
sysinfo() {
    echo "=== System Information ==="
    neofetch
    echo ""
    echo "=== Memory Usage ==="
    htop --version
    echo ""
    echo "=== Disk Usage ==="
    df -h
}

# Quick file search
search() {
    if [ -z "$1" ]; then
        echo "Usage: search <pattern>"
        return 1
    fi
    rg --color=always --line-number --no-heading --smart-case "$1" | fzf --ansi
}

# Quick directory navigation
nav() {
    local dir
    dir=$(find . -type d -not -path '*/\.*' | fzf) && cd "$dir"
}

# ===== THEME MANAGEMENT FUNCTIONS =====

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

# Function to switch terminal colors based on system theme
switch_terminal_theme() {
    local config_dir="$(dirname "$0")/configs"
    local ghostty_config_dir="$HOME/.config/ghostty"
    
    # Create ghostty config directory if it doesn't exist
    mkdir -p "$ghostty_config_dir"
    
    if is_dark_mode; then
        # Dark mode colors
        echo "🌙 Switching to dark mode colors..."
        cp "$config_dir/ghostty.conf" "$ghostty_config_dir/ghostty.conf"
        echo "✅ Dark mode configuration applied!"
    else
        # Light mode colors  
        echo "☀️ Switching to light mode colors..."
        cp "$config_dir/ghostty-light.conf" "$ghostty_config_dir/ghostty.conf"
        echo "✅ Light mode configuration applied!"
    fi
    echo "💡 Restart Ghostty to see the changes"
}

# Function to switch to specific theme
switch_theme() {
    local theme="${1:-auto}"
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local switch_script="$script_dir/../scripts/switch-theme.sh"
    
    if [[ -f "$switch_script" ]]; then
        bash "$switch_script" "$theme"
    else
        echo "❌ Theme switching script not found at: $switch_script"
        echo "💡 Make sure you're running this from the correct directory"
    fi
}

# Function to switch to specific theme
switch_to_light() {
    local config_dir="$(dirname "$0")/configs"
    local ghostty_config_dir="$HOME/.config/ghostty"
    mkdir -p "$ghostty_config_dir"
    cp "$config_dir/ghostty-light.conf" "$ghostty_config_dir/ghostty.conf"
    echo "☀️ Switched to light mode! Restart Ghostty to see changes."
}

switch_to_dark() {
    local config_dir="$(dirname "$0")/configs"
    local ghostty_config_dir="$HOME/.config/ghostty"
    mkdir -p "$ghostty_config_dir"
    cp "$config_dir/ghostty.conf" "$ghostty_config_dir/ghostty.conf"
    echo "🌙 Switched to dark mode! Restart Ghostty to see changes."
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

# Quick conda environment activation with fzf
conda_activate() {
    local env
    env=$(conda env list | grep -v '^#' | awk '{print $1}' | fzf --height=40% --reverse)
    [ -n "$env" ] && conda activate "$env"
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

# ===== CONDA INITIALIZATION =====
# Initialize conda for zsh
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="$HOME/miniconda3/bin:$PATH"
fi

# Add conda to PATH (keeping your existing conda setup)
export PATH="$HOME/.local/bin:$PATH"

# ===== FZF CONFIGURATION =====
# Use fd instead of find for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# FZF key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ===== KEYBOARD SHORTCUTS =====
# Bind Ctrl+R to fzf history search
bindkey '^R' fzf-history-widget

# Bind Ctrl+T to fzf file search
bindkey '^T' fzf-file-widget

# Bind Alt+C to fzf directory search
bindkey '\ec' fzf-cd-widget

# ===== AUTOCOMPLETE AND AUTOSUGGESTION KEY BINDINGS =====
# Enhanced Tab completion - Tab will complete what you're typing
bindkey '^I' complete-word

# Accept autosuggestion with Right Arrow (character by character)
bindkey '^[[C' forward-char

# Accept autosuggestion with End key (accept entire suggestion)
bindkey '^[[F' end-of-line

# Accept autosuggestion with Ctrl+Right Arrow (word by word)
bindkey '^[[1;5C' forward-word

# Accept autosuggestion with Ctrl+End (accept entire suggestion)
bindkey '^[[1;5F' end-of-line

# Better completion behavior
bindkey '^I' expand-or-complete-prefix

# ===== POWERLEVEL10K CONFIGURATION =====
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/shreyashgupta/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/shreyashgupta/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/shreyashgupta/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/shreyashgupta/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Auto-activate Python 3.12 environment
conda activate py312
