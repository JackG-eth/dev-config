# ⌨️ Neovim Shortcuts Reference

Complete reference for all keybindings in this Neovim configuration.

> **Note:** `<leader>` is mapped to `Space`

## Table of Contents
- [Essential Movement](#essential-movement)
- [File Navigation](#file-navigation)
- [Search & Find](#search--find)
- [Editing](#editing)
- [LSP Features](#lsp-features)
- [Git Integration](#git-integration)
- [Window Management](#window-management)
- [Toggles](#toggles)
- [Miscellaneous](#miscellaneous)

---

## Essential Movement

| Keybinding | Description |
|------------|-------------|
| `h` `j` `k` `l` | Left, Down, Up, Right |
| `w` `b` | Next word, Previous word |
| `e` | End of word |
| `0` `$` | Start of line, End of line |
| `gg` `G` | Top of file, Bottom of file |
| `{` `}` | Previous paragraph, Next paragraph |
| `%` | Jump to matching bracket |
| `<C-d>` | Scroll down (half page, centered) |
| `<C-u>` | Scroll up (half page, centered) |
| `<C-o>` | Jump to previous location |
| `<C-i>` | Jump to next location |

## File Navigation

### Neo-tree (File Explorer)

| Keybinding | Description |
|------------|-------------|
| `\` | Toggle Neo-tree file explorer |
| `r` / `R` | Refresh file tree (when in Neo-tree) |

### Buffer Navigation

| Keybinding | Description |
|------------|-------------|
| `<leader><leader>` | Find and switch between open buffers |

## Search & Find

### Telescope (Fuzzy Finder)

| Keybinding | Description |
|------------|-------------|
| `<leader>sf` | **[S]earch [F]iles** - Find files by name |
| `<leader>sg` | **[S]earch by [G]rep** - Search text in files |
| `<leader>sw` | **[S]earch current [W]ord** - Search word under cursor |
| `<leader>sh` | **[S]earch [H]elp** - Search help documentation |
| `<leader>sk` | **[S]earch [K]eymaps** - Find keybindings |
| `<leader>ss` | **[S]earch [S]elect Telescope** - Open Telescope picker |
| `<leader>sd` | **[S]earch [D]iagnostics** - Find errors/warnings |
| `<leader>sr` | **[S]earch [R]esume** - Resume last search |
| `<leader>s.` | **[S]earch Recent Files** - Recently opened files |
| `<leader>s/` | **[S]earch in Open Files** - Grep in open buffers |
| `<leader>sn` | **[S]earch [N]eovim files** - Search config files |
| `<leader>/` | Fuzzy search in current buffer |

### Search Navigation

| Keybinding | Description |
|------------|-------------|
| `n` | Next search result (centered) |
| `N` | Previous search result (centered) |
| `<Esc>` | Clear search highlights |
| `*` | Search for word under cursor |
| `#` | Search backwards for word under cursor |

## Editing

### Basic Editing

| Keybinding | Description |
|------------|-------------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at start of line |
| `A` | Insert at end of line |
| `o` | Open new line below |
| `O` | Open new line above |
| `x` | Delete character |
| `dd` | Delete line |
| `yy` | Yank (copy) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `<C-r>` | Redo |

### Advanced Editing

| Keybinding | Description |
|------------|-------------|
| `<leader>f` | **[F]ormat** buffer (auto-format code) |
| `gc` | Comment/uncomment (in visual mode or with motion) |
| `gcc` | Comment/uncomment current line |
| `<leader>p` | Paste without yanking (visual mode) |
| `<leader>y` | Copy to system clipboard (visual mode) |
| `<leader>c` | Copy to system clipboard (normal mode) |
| `<leader>cc` | Copy line to system clipboard |

### Visual Mode

| Keybinding | Description |
|------------|-------------|
| `v` | Enter visual mode (character) |
| `V` | Enter visual mode (line) |
| `<C-v>` | Enter visual block mode |
| `>` | Indent right (keeps selection) |
| `<` | Indent left (keeps selection) |
| `J` | Move selection down |
| `K` | Move selection up |

### Text Objects

| Keybinding | Description |
|------------|-------------|
| `viw` | Select inner word |
| `vaw` | Select around word |
| `vi"` | Select inside quotes |
| `va"` | Select around quotes (includes quotes) |
| `vi(` | Select inside parentheses |
| `va(` | Select around parentheses |
| `vi{` | Select inside braces |
| `va{` | Select around braces |
| `vip` | Select inner paragraph |
| `vap` | Select around paragraph |

### Surround (mini.surround)

| Keybinding | Description |
|------------|-------------|
| `sa` + motion + char | **[S]urround [A]dd** - Add surroundings |
| `sd` + char | **[S]urround [D]elete** - Delete surroundings |
| `sr` + old + new | **[S]urround [R]eplace** - Replace surroundings |

**Examples:**
- `saiw"` - Surround inner word with quotes
- `sd"` - Delete surrounding quotes
- `sr"'` - Replace " with '

## LSP Features

| Keybinding | Description |
|------------|-------------|
| `K` | Show hover documentation |
| `grn` | **[R]e[n]ame** symbol |
| `gra` | **[G]oto Code [A]ction** |
| `grd` | **[G]oto [D]efinition** |
| `grD` | **[G]oto [D]eclaration** |
| `gri` | **[G]oto [I]mplementation** |
| `grr` | **[G]oto [R]eferences** |
| `grt` | **[G]oto [T]ype Definition** |
| `gO` | Open Document Symbols |
| `gW` | Open Workspace Symbols |
| `<leader>q` | Open diagnostic quickfix list |
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |

## Git Integration

### Git Signs (in gutter)

| Keybinding | Description |
|------------|-------------|
| `]c` | Jump to next git change |
| `[c` | Jump to previous git change |

### Git Hunks

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>hs` | normal/visual | Git stage hunk |
| `<leader>hr` | normal/visual | Git reset hunk |
| `<leader>hS` | normal | Git stage buffer |
| `<leader>hu` | normal | Git undo stage hunk |
| `<leader>hR` | normal | Git reset buffer |
| `<leader>hp` | normal | Git preview hunk |
| `<leader>hb` | normal | Git blame line |
| `<leader>hd` | normal | Git diff against index |
| `<leader>hD` | normal | Git diff against last commit |

## Window Management

### Window Navigation

| Keybinding | Description |
|------------|-------------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to lower window |
| `<C-k>` | Move to upper window |
| `<C-l>` | Move to right window |

### Window Operations

| Keybinding | Description |
|------------|-------------|
| `<C-w>s` | Split horizontally |
| `<C-w>v` | Split vertically |
| `<C-w>q` | Close window |
| `<C-w>=` | Equalize window sizes |
| `<C-w>o` | Close all other windows |

### Terminal

| Keybinding | Description |
|------------|-------------|
| `<Esc><Esc>` | Exit terminal mode |
| `:term` | Open terminal |

## Toggles

| Keybinding | Description |
|------------|-------------|
| `<leader>th` | **[T]oggle Inlay [H]ints** (Rust/LSP) |
| `<leader>tb` | **[T]oggle Git Show [B]lame Line** |
| `<leader>tD` | **[T]oggle Git Show [D]eleted** |

## Miscellaneous

### Command Mode

| Keybinding | Description |
|------------|-------------|
| `:` | Enter command mode |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |
| `:e filename` | Open file |
| `:Mason` | Open Mason (LSP installer) |
| `:Lazy` | Open Lazy (plugin manager) |
| `:checkhealth` | Check Neovim health |

### Special Windows

| Keybinding | Description |
|------------|-------------|
| `q` | Close help/quickfix/man pages |

### Macros

| Keybinding | Description |
|------------|-------------|
| `q` + letter | Start recording macro |
| `q` | Stop recording |
| `@` + letter | Play macro |
| `@@` | Replay last macro |

### Marks

| Keybinding | Description |
|------------|-------------|
| `m` + letter | Set mark |
| `'` + letter | Jump to mark |
| `''` | Jump to previous position |

## Plugin-Specific Commands

### Which-Key Helper

- Press `<leader>` and wait to see all available commands
- Press any prefix (like `<leader>s`) and wait to see search commands

### Telescope (While Open)

| Keybinding | Description |
|------------|-------------|
| `<C-n>` / `<Down>` | Next item |
| `<C-p>` / `<Up>` | Previous item |
| `<C-c>` / `<Esc>` | Close Telescope |
| `<CR>` | Select item |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<C-u>` | Scroll preview up |
| `<C-d>` | Scroll preview down |

### Completion (Blink.cmp)

| Keybinding | Description |
|------------|-------------|
| `<CR>` | Accept completion |
| `<C-n>` | Next completion |
| `<C-p>` | Previous completion |
| `<C-e>` | Close completion menu |
| `<C-space>` | Trigger completion |
| `<Tab>` | Next snippet placeholder |
| `<S-Tab>` | Previous snippet placeholder |

## Quick Tips

1. **Learning Motions**: Try `:Tutor` for interactive Vim tutorial
2. **Finding Help**: Use `:help <topic>` or `<leader>sh` to search help
3. **Command Palette**: Press `<leader>ss` to search Telescope pickers
4. **Buffer List**: Press `<leader><leader>` to quickly switch files
5. **File Search**: Press `<leader>sf` for fuzzy file finding
6. **Grep Search**: Press `<leader>sg` to search text across project
7. **Recent Files**: Press `<leader>s.` for recently opened files
8. **Config Files**: Press `<leader>sn` to search your Neovim config

## Getting Help

- `:help` - Open help documentation
- `:help <topic>` - Search for specific help
- `<leader>sh` - Search all help topics with Telescope
- `K` - Show documentation for item under cursor (LSP)
- `<leader>sk` - Search all keymaps

---

**Pro Tip:** Press `<leader>` and wait a moment - which-key will show you all available commands! This is the best way to discover keybindings.
