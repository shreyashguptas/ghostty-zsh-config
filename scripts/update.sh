#!/bin/bash

# Ghostty ZSH Configuration Update Script
# This script updates all the tools and configurations

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}================================${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}================================${NC}"
}

print_header "🔄 Updating Ghostty ZSH Configuration"

# Update Homebrew
print_status "Updating Homebrew..."
brew update

# Upgrade all installed packages
print_status "Upgrading all installed packages..."
brew upgrade

# Update Oh My Zsh
print_status "Updating Oh My Zsh..."
cd ~/.oh-my-zsh && git pull

# Update Oh My Zsh plugins
print_status "Updating Oh My Zsh plugins..."

# Update zsh-autosuggestions
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    cd "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" && git pull
    print_success "zsh-autosuggestions updated"
fi

# Update zsh-syntax-highlighting
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    cd "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" && git pull
    print_success "zsh-syntax-highlighting updated"
fi

# Update zsh-completions
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
    cd "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions" && git pull
    print_success "zsh-completions updated"
fi

# Update Powerlevel10k
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    cd "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k" && git pull
    print_success "Powerlevel10k updated"
fi

# Update fzf
print_status "Updating fzf..."
$(brew --prefix)/opt/fzf/install --all

print_success "All tools and configurations updated successfully!"

echo ""
echo -e "${GREEN}🎉 Update complete!${NC}"
echo "Restart your terminal or run 'source ~/.zshrc' to apply any changes."