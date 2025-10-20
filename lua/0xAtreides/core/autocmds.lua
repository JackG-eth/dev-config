-- Autocommands for Neovim
-- These are event-based automations that run when certain events occur

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode to yank a paragraph
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits when window is resized',
  group = vim.api.nvim_create_augroup('resize-splits', { clear = true }),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- Close certain filetypes with 'q'
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Close certain windows with q',
  group = vim.api.nvim_create_augroup('close-with-q', { clear = true }),
  pattern = {
    'help',
    'lspinfo',
    'man',
    'qf',
    'checkhealth',
    'notify',
    'startuptime',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Remove trailing whitespace on save (optional, uncomment if desired)
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   desc = 'Remove trailing whitespace on save',
--   group = vim.api.nvim_create_augroup('trim-whitespace', { clear = true }),
--   pattern = '*',
--   callback = function()
--     local save_cursor = vim.fn.getpos('.')
--     vim.cmd([[%s/\s\+$//e]])
--     vim.fn.setpos('.', save_cursor)
--   end,
-- })

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Go to last location when opening a buffer',
  group = vim.api.nvim_create_augroup('last-location', { clear = true }),
  callback = function(event)
    local exclude_bt = { 'help', 'nofile', 'quickfix' }
    local buf = event.buf
    if vim.tbl_contains(exclude_bt, vim.bo[buf].buftype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  desc = 'Show cursor line only in active window',
  group = vim.api.nvim_create_augroup('auto-cursorline-show', { clear = true }),
  callback = function()
    if vim.wo.cursorline then
      vim.wo.cursorline = true
    end
  end,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
  desc = 'Hide cursor line in inactive windows',
  group = vim.api.nvim_create_augroup('auto-cursorline-hide', { clear = true }),
  callback = function()
    if vim.wo.cursorline then
      vim.wo.cursorline = false
    end
  end,
})

-- Check if file changed outside of vim
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  desc = 'Check if file changed outside of vim',
  group = vim.api.nvim_create_augroup('checktime', { clear = true }),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end,
})
