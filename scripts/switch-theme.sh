#!/bin/bash

# Theme switching script for Ghostty terminal
# Usage: ./switch-theme.sh [light|dark|auto]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$(dirname "$SCRIPT_DIR")/configs"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
# Ghostty reads a file literally named "config" — not "ghostty.conf".
GHOSTTY_CONFIG_FILE="$GHOSTTY_CONFIG_DIR/config"

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

# Function to switch to dark mode
switch_to_dark() {
    echo -e "${BLUE}🌙 Switching to dark mode...${NC}"
    
    # Copy dark mode config
    cp "$CONFIG_DIR/ghostty.conf" "$GHOSTTY_CONFIG_FILE"
    
    echo -e "${GREEN}✅ Dark mode configuration applied!${NC}"
    echo -e "${YELLOW}💡 Press Cmd+Shift+, in Ghostty to reload, or restart it${NC}"
}

# Function to switch to light mode
switch_to_light() {
    echo -e "${BLUE}☀️ Switching to light mode...${NC}"
    
    # Copy light mode config
    cp "$CONFIG_DIR/ghostty-light.conf" "$GHOSTTY_CONFIG_FILE"
    
    echo -e "${GREEN}✅ Light mode configuration applied!${NC}"
    echo -e "${YELLOW}💡 Press Cmd+Shift+, in Ghostty to reload, or restart it${NC}"
}

# Function to auto-detect and switch
switch_auto() {
    if is_dark_mode; then
        switch_to_dark
    else
        switch_to_light
    fi
}

# Main function
main() {
    # Create ghostty config directory if it doesn't exist
    mkdir -p "$GHOSTTY_CONFIG_DIR"
    
    case "${1:-auto}" in
        "dark")
            switch_to_dark
            ;;
        "light")
            switch_to_light
            ;;
        "auto")
            switch_auto
            ;;
        *)
            echo -e "${RED}❌ Invalid option: $1${NC}"
            echo -e "${YELLOW}Usage: $0 [light|dark|auto]${NC}"
            echo -e "${BLUE}  light  - Switch to light mode${NC}"
            echo -e "${BLUE}  dark   - Switch to dark mode${NC}"
            echo -e "${BLUE}  auto   - Auto-detect system theme (default)${NC}"
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"