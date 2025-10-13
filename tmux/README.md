# Tmux Setup

Custom tmux configuration with vim-style keybindings and a clean status bar.

## Installation

Run the installation script:
```bash
./install_tmux.sh
```

The script will:
- Install Homebrew and tmux (if needed)
- Backup existing config
- Install the configuration
- Optionally install TPM plugin manager
- Add shell aliases

## Manual Installation

```bash
brew install tmux
cp .tmux.conf ~/.tmux.conf
tmux
```

## Key Features

- **Prefix**: `Ctrl+a` (instead of `Ctrl+b`)
- **Split panes**: `Ctrl+a + |` (horizontal), `Ctrl+a + -` (vertical)
- **Navigate**: `Ctrl+a + h/j/k/l`
- **Resize**: `Ctrl+a + H/J/K/L`
- **Reload config**: `Ctrl+a + r`
- Mouse support enabled
- Vi-style copy mode

## Aliases (optional)

```bash
alias tm='tmux'
alias tma='tmux attach-session -t'
alias tmn='tmux new-session -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'
```
