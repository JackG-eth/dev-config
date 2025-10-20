-- Leader key must be set before lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false

-- Line numbers
vim.o.number = true

-- Mouse support
vim.o.mouse = 'a'

-- Don't show mode (statusline shows it)
vim.o.showmode = false

-- Sync clipboard with OS
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Indentation
vim.o.breakindent = true

-- Undo history
vim.o.undofile = true

-- Case-insensitive searching (unless \C or capital in search)
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Split behavior
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live preview of substitutions
vim.o.inccommand = 'split'

-- Cursor line highlight
vim.o.cursorline = true

-- Scrolloff
vim.o.scrolloff = 10

-- Confirm before failing operations
vim.o.confirm = true
