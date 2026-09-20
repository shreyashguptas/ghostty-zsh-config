#!/bin/bash

# Ghostty ZSH Configuration Installation Script
# This script sets up your Ghostty terminal with all the enhancements

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}================================${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}================================${NC}"
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Conda is optional. It is ~400MB and adds time to every shell start, so it is
# off by default. Pass --with-conda to install Miniconda and a py312 env.
INSTALL_CONDA=false
for arg in "$@"; do
    case "$arg" in
        --with-conda) INSTALL_CONDA=true ;;
        -h|--help)
            echo "Usage: $0 [--with-conda]"
            echo "  --with-conda   Also install Miniconda and create a py312 environment"
            exit 0
            ;;
        *)
            echo "Unknown option: $arg (try --help)"
            exit 1
            ;;
    esac
done

print_header "🚀 Ghostty ZSH Configuration Setup"
echo "Setting up your enhanced Ghostty terminal..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS. Please run the manual installation steps."
    exit 1
fi

print_success "macOS detected"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_success "Homebrew found"
fi

# Check if Ghostty is installed
if ! command -v ghostty &> /dev/null; then
    print_warning "Ghostty is not installed. Installing Ghostty..."
    brew install --cask ghostty
else
    print_success "Ghostty found"
fi

print_header "📦 Installing Required Tools"

# Nerd Font is required for the Powerlevel10k prompt icons
print_status "Installing Nerd Fonts..."
brew install --cask font-jetbrains-mono-nerd-font

print_success "All tools installed successfully"

if [ "$INSTALL_CONDA" = true ]; then

print_header "🐍 Setting Up Conda and Python 3.12"

# Check if Conda is already installed (check both command and directory)
if ! command -v conda &> /dev/null && [ ! -d "$HOME/miniconda3" ]; then
    print_status "Installing Miniconda..."

    # Download Miniconda installer
    if [[ $(uname -m) == "arm64" ]]; then
        curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
        bash Miniconda3-latest-MacOSX-arm64.sh -b -p $HOME/miniconda3
        rm -f Miniconda3-latest-MacOSX-arm64.sh
    else
        curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
        bash Miniconda3-latest-MacOSX-x86_64.sh -b -p $HOME/miniconda3
        rm -f Miniconda3-latest-MacOSX-x86_64.sh
    fi

    print_success "Miniconda installed"
else
    print_success "Conda already installed"
fi

# Initialize Conda for zsh
print_status "Initializing Conda for zsh..."
$HOME/miniconda3/bin/conda init zsh

# Accept Conda Terms of Service (required for Anaconda channels)
print_status "Accepting Conda Terms of Service..."
$HOME/miniconda3/bin/conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main 2>/dev/null || true
$HOME/miniconda3/bin/conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r 2>/dev/null || true

# Create Python 3.12 environment (skip if already exists)
if $HOME/miniconda3/bin/conda env list | grep -q "^py312 "; then
    print_success "Python 3.12 environment already exists"
else
    print_status "Creating Python 3.12 environment..."
    $HOME/miniconda3/bin/conda create -n py312 python=3.12 -y
fi

print_success "Conda and Python 3.12 setup complete"

else
    print_status "Skipping Conda (pass --with-conda to install it)"
fi

print_header "🔧 Setting Up Oh My Zsh"

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_status "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    print_success "Oh My Zsh already installed"
fi

# Install Oh My Zsh plugins
print_status "Installing Oh My Zsh plugins..."

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    print_success "zsh-autosuggestions installed"
else
    print_success "zsh-autosuggestions already installed"
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    print_success "zsh-syntax-highlighting installed"
else
    print_success "zsh-syntax-highlighting already installed"
fi

# zsh-completions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
    print_success "zsh-completions installed"
else
    print_success "zsh-completions already installed"
fi

# Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    print_success "Powerlevel10k installed"
else
    print_success "Powerlevel10k already installed"
fi

print_header "📁 Setting Up Configuration Files"

# Create necessary directories
print_status "Creating configuration directories..."
mkdir -p ~/.config/ghostty/themes
mkdir -p ~/Development
mkdir -p ~/Projects
mkdir -p ~/Scripts

# Copy configuration files
print_status "Copying configuration files..."

# Backup existing files if they exist
if [ -f ~/.zshrc ]; then
    print_status "Backing up existing .zshrc to .zshrc.backup"
    cp ~/.zshrc ~/.zshrc.backup
fi

if [ -f ~/.config/ghostty/config ]; then
    print_status "Backing up existing Ghostty config to config.backup"
    cp ~/.config/ghostty/config ~/.config/ghostty/config.backup
fi

# Validate the palettes before installing them. Ghostty silently accepts a
# config full of unknown fields at parse time and only complains in a dialog
# on launch, so catch a broken config here instead of shipping it.
if command -v ghostty &> /dev/null; then
    for conf in "$REPO_DIR/configs/ghostty.conf" "$REPO_DIR/configs/ghostty-light.conf"; do
        if ! ghostty +validate-config --config-file="$conf" 2>&1; then
            print_error "Invalid Ghostty config: $conf (see errors above)"
            exit 1
        fi
    done
    print_success "Ghostty configs validated"
fi

# Install both palettes so theme switching works without the repo present
cp "$REPO_DIR/configs/ghostty.conf" ~/.config/ghostty/themes/dark.conf
cp "$REPO_DIR/configs/ghostty-light.conf" ~/.config/ghostty/themes/light.conf

# Ghostty reads a file literally named "config" — not "ghostty.conf".
# Pick the palette that matches the current macOS appearance.
if [ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = "Dark" ]; then
    cp ~/.config/ghostty/themes/dark.conf ~/.config/ghostty/config
    print_status "Applied dark palette (matches current macOS appearance)"
else
    cp ~/.config/ghostty/themes/light.conf ~/.config/ghostty/config
    print_status "Applied light palette (matches current macOS appearance)"
fi

cp "$REPO_DIR/configs/.zshrc" ~/
cp "$REPO_DIR/configs/.p10k.zsh" ~/
cp "$REPO_DIR/configs/ghostty-ssh-colors.zsh" ~/.ghostty-ssh-colors.zsh

print_success "Configuration files copied"

print_header "🔧 Configuring Git"

# Make the first push on a new branch set its upstream automatically.
# Without an upstream there is nothing for the prompt to compare against, so
# the ahead/behind (⇡/⇣) indicator stays blank until this is set.
print_status "Enabling push.autoSetupRemote..."
git config --global push.autoSetupRemote true

# Drop remote-tracking refs for branches that no longer exist on the remote.
print_status "Enabling fetch.prune..."
git config --global fetch.prune true

print_success "Git configured"

print_header "🎉 Installation Complete!"

echo ""
print_success "Your Ghostty terminal has been successfully enhanced!"
echo ""
echo -e "${CYAN}📋 What's been set up:${NC}"
echo "   ✅ Ghostty configuration with multi-line paste support"
echo "   ✅ Oh My Zsh with Powerlevel10k theme"
echo "   ✅ Autosuggestions, syntax highlighting and Tab completions"
echo "   ✅ Conda package manager with Python 3.12 environment"
echo "   ✅ Useful aliases and functions (including Conda shortcuts)"
echo "   ✅ Fast prompt with git branch, status and ahead/behind counts"
echo ""
echo -e "${CYAN}🔧 New features available:${NC}"
echo "   • Multi-line paste (no more 'Are you sure?' prompts)"
echo "   • Inline autosuggestions from history (→ to accept)"
echo "   • Git branch, dirty state and ahead/behind counts in the prompt"
echo "   • Light/dark theme switching: 'light', 'dark', 'theme-auto'"
echo "   • Auto-tinted tabs per SSH host (deterministic color from hostname)"
echo "   • Weather with 'weather <city>'"
echo "   • Conda package management with Python 3.12"
echo "   • Conda shortcuts: ca, cda, ce, ci, cc, cr, cup, csp"
echo ""
echo -e "${YELLOW}🚀 Next steps:${NC}"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Configure your prompt: p10k configure"
echo "3. Try the new features!"
echo ""
echo -e "${CYAN}💡 Pro tips:${NC}"
echo "   • Use 'p10k configure' to customize your prompt"
echo "   • Use 'ac-help' to see autosuggestion/completion shortcuts"
echo "   • Use 'light' / 'dark' to switch the Ghostty color scheme"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}"