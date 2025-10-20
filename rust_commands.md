# 🦀 Rust Commands Reference

Complete reference for all Rust-related keybindings in this Neovim configuration.

## Core Rust Commands (`<leader>r`)

| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>rr` | `:RustLsp runnables` | Opens picker to run/test/debug current file |
| `<leader>rp` | `:RustLsp parentModule` | Jump to parent module |
| `<leader>rt` | `:RustLsp openCargo` | Open Cargo.toml |
| `<leader>re` | `:RustLsp explainError` | Explain the error under cursor |
| `<leader>rm` | `:RustLsp expandMacro` | Expand macro recursively |
| `<leader>rd` | `:RustLsp debuggables` | Open debuggables picker |
| `<leader>rD` | `:RustLsp renderDiagnostic` | Render diagnostic with full context |

## Crates Commands (`<leader>C`)

**Note:** These commands only work in `Cargo.toml` files.

| Keybinding | Command | Description |
|------------|---------|-------------|
| `<leader>Co` | Show popup | Show crate details popup |
| `<leader>Cr` | Reload | Reload crates data |
| `<leader>Cv` | Show versions | Show available versions |
| `<leader>Cf` | Show features | Show available features |
| `<leader>Cd` | Show deps | Show dependencies |
| `<leader>Cu` | Update crate | Update crate under cursor |
| `<leader>Ca` | Update all | Update all crates |
| `<leader>CU` | Upgrade crate | Upgrade crate to latest |
| `<leader>CA` | Upgrade all | Upgrade all crates to latest |
| `<leader>CH` | Open homepage | Open crate's homepage |
| `<leader>CR` | Open repo | Open crate's repository |
| `<leader>CD` | Open docs | Open crate's documentation |
| `<leader>CC` | Open crates.io | Open crate on crates.io |

## LSP Commands (General)

These work in all Rust files and use LSP functionality:

| Keybinding | Command | Description |
|------------|---------|-------------|
| `grn` | Rename | Rename symbol under cursor |
| `<leader>a` | Code action | Show code actions (Rust-specific) |
| `grr` | References | Find all references |
| `gri` | Implementations | Go to implementations |
| `grd` | Definition | Go to definition |
| `grD` | Declaration | Go to declaration |
| `gO` | Document symbols | Show symbols in current file |
| `gW` | Workspace symbols | Show symbols in workspace |
| `grt` | Type definition | Go to type definition |
| `K` | Hover | Show documentation (built-in Neovim) |
| `<leader>th` | Toggle hints | Toggle inlay hints |

## Additional RustLsp Commands

These aren't mapped to keybindings but can be run with `:RustLsp <command>`:

| Command | Description |
|---------|-------------|
| `:RustLsp moveItem up` | Move item up |
| `:RustLsp moveItem down` | Move item down |
| `:RustLsp hover actions` | Show hover actions |
| `:RustLsp hover range` | Show hover for range |
| `:RustLsp crateGraph` | View crate graph |
| `:RustLsp syntaxTree` | View syntax tree |
| `:RustLsp flyCheck` | Run fly check |
| `:RustLsp view hir` | View HIR (High-level IR) |
| `:RustLsp view mir` | View MIR (Mid-level IR) |

## Common Workflows

### Running Code
1. Press `<leader>rr` to open the runnables picker
2. Select:
   - **Run** - Execute the current file/function
   - **Test** - Run tests
   - **Debug** - Start debugging session

### Managing Dependencies
1. Open `Cargo.toml`
2. Place cursor on a crate line (e.g., `serde = "1.0"`)
3. Press `<leader>Cv` to see available versions
4. Press `<leader>Cu` to update to selected version
5. Press `<leader>Ca` to update all crates at once

### Debugging Errors
1. Place cursor on an error or warning
2. Press `<leader>re` to get a detailed explanation
3. Press `<leader>rD` to see the full diagnostic with context
4. Press `<leader>a` to see available code actions/fixes

### Refactoring
1. Place cursor on variable/function name
2. Press `grn` to rename across entire project
3. Press `<leader>a` to see available refactorings (extract function, inline, etc.)

### Navigating Code
1. Press `grd` to jump to definition
2. Press `grr` to find all references
3. Press `gri` to see implementations
4. Press `<C-t>` to jump back

### Working with Macros
1. Place cursor inside a macro invocation
2. Press `<leader>rm` to expand it recursively
3. See the generated code

## Pro Tips

- **Discovery**: Press `<leader>` and wait - which-key will show all available commands
- **Context-aware**: `<leader>rr` shows different options based on context (binary, test, example, etc.)
- **Cargo.toml**: Hover over any crate name and use `<leader>C` commands
- **Inlay hints**: Toggle with `<leader>th` to see type hints inline
- **Quick docs**: Press `K` twice to jump into the hover window for better reading

## Troubleshooting

**LSP not working?**
- Run `:LspInfo` to check if rust-analyzer is attached
- Run `:Mason` to ensure rust-analyzer is installed

**Crates commands not working?**
- Make sure you're in a `Cargo.toml` file
- Run `:Lazy` to verify crates.nvim is installed

**Want to add custom keybindings?**
- Edit `after/ftplugin/rust.lua` to add your own mappings
