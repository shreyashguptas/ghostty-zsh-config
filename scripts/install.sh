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

# Install core tools
print_status "Installing core productivity tools..."
brew install fzf bat eza fd ripgrep tree htop lazygit delta

# Install fonts
print_status "Installing Nerd Fonts..."
brew install --cask font-jetbrains-mono-nerd-font

print_success "All tools installed successfully"

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
mkdir -p ~/.config/ghostty
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

if [ -f ~/.config/ghostty/ghostty.conf ]; then
    print_status "Backing up existing ghostty.conf to ghostty.conf.backup"
    cp ~/.config/ghostty/ghostty.conf ~/.config/ghostty/ghostty.conf.backup
fi

# Copy new configuration files
cp "$REPO_DIR/configs/ghostty.conf" ~/.config/ghostty/
cp "$REPO_DIR/configs/.zshrc" ~/
cp "$REPO_DIR/configs/.p10k.zsh" ~/

print_success "Configuration files copied"

print_header "🔧 Setting Up Additional Tools"

# Set up fzf
print_status "Setting up fzf..."
$(brew --prefix)/opt/fzf/install --all

# Configure git delta
print_status "Configuring git delta..."
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global delta.syntax-theme "Monokai Extended"

print_success "Additional tools configured"

print_header "🎉 Installation Complete!"

echo ""
print_success "Your Ghostty terminal has been successfully enhanced!"
echo ""
echo -e "${CYAN}📋 What's been set up:${NC}"
echo "   ✅ Ghostty configuration with multi-line paste support"
echo "   ✅ Oh My Zsh with Powerlevel10k theme"
echo "   ✅ Essential plugins (autosuggestions, syntax highlighting, etc.)"
echo "   ✅ Productivity tools (fzf, bat, eza, fd, ripgrep, lazygit, delta)"
echo "   ✅ Useful aliases and functions"
echo "   ✅ Beautiful prompt with git status and system info"
echo ""
echo -e "${CYAN}🔧 New features available:${NC}"
echo "   • Multi-line paste (no more 'Are you sure?' prompts)"
echo "   • Fuzzy file search with Ctrl+T"
echo "   • Fuzzy directory navigation with Alt+C"
echo "   • Fuzzy history search with Ctrl+R"
echo "   • Better file listing with 'ls' (now uses eza)"
echo "   • Syntax highlighted 'cat' (now uses bat)"
echo "   • Faster 'find' (now uses fd)"
echo "   • Better 'grep' (now uses ripgrep)"
echo "   • Git GUI with 'lg' (lazygit)"
echo "   • System info with 'sysinfo'"
echo "   • Weather with 'weather <city>'"
echo ""
echo -e "${YELLOW}🚀 Next steps:${NC}"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Configure your prompt: p10k configure"
echo "3. Try the new features!"
echo ""
echo -e "${CYAN}💡 Pro tips:${NC}"
echo "   • Use 'p10k configure' to customize your prompt"
echo "   • Use 'lg' for a beautiful git interface"
echo "   • Use 'fzf-open' to quickly open files"
echo "   • Use 'nav' for quick directory navigation"
echo "   • Use 'sysinfo' to see system information"
echo ""
echo -e "${GREEN}Happy coding! 🚀${NC}"