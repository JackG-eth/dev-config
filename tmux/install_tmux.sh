#!/usr/bin/env bash

# ============================
# TMUX INSTALLATION & SETUP SCRIPT
# ============================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/.tmux.conf"

print_status "Starting tmux installation and setup..."

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS. Please modify for your OS."
    exit 1
fi

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew if not present
if ! command_exists brew; then
    print_status "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add brew to PATH for current session
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    
    print_success "Homebrew installed successfully!"
else
    print_status "Homebrew is already installed."
fi

# Install tmux
if ! command_exists tmux; then
    print_status "Installing tmux..."
    brew install tmux
    print_success "tmux installed successfully!"
else
    print_status "tmux is already installed."
    CURRENT_VERSION=$(tmux -V)
    print_status "Current version: $CURRENT_VERSION"
    
    # Optionally update tmux
    read -p "Would you like to update tmux to the latest version? (y/N): " update_tmux
    if [[ $update_tmux =~ ^[Yy]$ ]]; then
        print_status "Updating tmux..."
        brew upgrade tmux
        print_success "tmux updated successfully!"
    fi
fi

# Check if config file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    print_error "Configuration file not found at: $CONFIG_FILE"
    print_error "Make sure .tmux.conf exists in the same directory as this script."
    exit 1
fi

# Backup existing tmux config if it exists
TMUX_CONF_PATH="$HOME/.tmux.conf"
if [[ -f "$TMUX_CONF_PATH" ]]; then
    BACKUP_PATH="$HOME/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)"
    print_warning "Existing tmux config found. Creating backup at: $BACKUP_PATH"
    cp "$TMUX_CONF_PATH" "$BACKUP_PATH"
fi

# Copy configuration file
print_status "Installing tmux configuration..."
cp "$CONFIG_FILE" "$TMUX_CONF_PATH"
print_success "Configuration installed at: $TMUX_CONF_PATH"

# Ask about TPM installation
echo
read -p "Would you like to install TPM (Tmux Plugin Manager)? This allows you to use tmux plugins. (y/N): " install_tpm

if [[ $install_tpm =~ ^[Yy]$ ]]; then
    TPM_DIR="$HOME/.tmux/plugins/tpm"
    
    if [[ -d "$TPM_DIR" ]]; then
        print_warning "TPM is already installed at: $TPM_DIR"
        read -p "Would you like to update it? (y/N): " update_tpm
        if [[ $update_tpm =~ ^[Yy]$ ]]; then
            print_status "Updating TPM..."
            cd "$TPM_DIR"
            git pull
            print_success "TPM updated!"
        fi
    else
        print_status "Installing TPM..."
        git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
        print_success "TPM installed at: $TPM_DIR"
    fi
    
    # Enable TPM in config
    print_status "Enabling TPM in configuration..."
    
    # Create a temporary config with TPM enabled
    TEMP_CONF=$(mktemp)
    sed 's/^# set -g @plugin/set -g @plugin/g; s/^# run/run/g' "$TMUX_CONF_PATH" > "$TEMP_CONF"
    mv "$TEMP_CONF" "$TMUX_CONF_PATH"
    
    print_success "TPM configuration enabled!"
    print_status "To install plugins:"
    print_status "1. Start tmux: tmux"
    print_status "2. Press: Ctrl+a then Shift+i"
    print_status "3. Wait for plugins to install"
fi

# Test tmux configuration
print_status "Testing tmux configuration..."
if tmux -f "$TMUX_CONF_PATH" new-session -d -s test_session 2>/dev/null; then
    tmux kill-session -t test_session 2>/dev/null
    print_success "Configuration test passed!"
else
    print_warning "Configuration test failed. Please check for syntax errors."
fi

# Create useful aliases (optional)
echo
read -p "Would you like to add useful tmux aliases to your shell? (y/N): " add_aliases

if [[ $add_aliases =~ ^[Yy]$ ]]; then
    SHELL_CONFIG=""
    
    # Detect shell config file
    if [[ $SHELL == */zsh ]] || [[ -n $ZSH_VERSION ]]; then
        SHELL_CONFIG="$HOME/.zshrc"
    elif [[ $SHELL == */bash ]] || [[ -n $BASH_VERSION ]]; then
        if [[ -f "$HOME/.bashrc" ]]; then
            SHELL_CONFIG="$HOME/.bashrc"
        else
            SHELL_CONFIG="$HOME/.bash_profile"
        fi
    fi
    
    if [[ -n "$SHELL_CONFIG" ]]; then
        print_status "Adding aliases to: $SHELL_CONFIG"
        
        # Check if aliases already exist
        if ! grep -q "# Tmux aliases" "$SHELL_CONFIG" 2>/dev/null; then
            cat >> "$SHELL_CONFIG" << 'EOF'

# Tmux aliases
alias tm='tmux'
alias tma='tmux attach-session -t'
alias tmn='tmux new-session -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'
EOF
            print_success "Aliases added! Reload your shell or run: source $SHELL_CONFIG"
        else
            print_status "Tmux aliases already exist in $SHELL_CONFIG"
        fi
    else
        print_warning "Could not detect shell configuration file."
    fi
fi

echo
print_success "==================================="
print_success "TMUX INSTALLATION COMPLETE!"
print_success "==================================="
echo
print_status "Quick start guide:"
print_status "• Start tmux: tmux"
print_status "• Prefix key: Ctrl+a (instead of default Ctrl+b)"
print_status "• Split horizontal: Ctrl+a then |"
print_status "• Split vertical: Ctrl+a then -"
print_status "• Navigate panes: Ctrl+a then h/j/k/l"
print_status "• Reload config: Ctrl+a then r"
print_status "• List sessions: tmux list-sessions"

if [[ $install_tpm =~ ^[Yy]$ ]]; then
    echo
    print_status "TPM Plugin Manager:"
    print_status "• Install plugins: Ctrl+a then Shift+i"
    print_status "• Update plugins: Ctrl+a then Shift+u"
    print_status "• Remove plugins: Ctrl+a then Alt+u"
fi

echo
print_status "Configuration file: $TMUX_CONF_PATH"
print_status "Happy tmuxing! 🚀"