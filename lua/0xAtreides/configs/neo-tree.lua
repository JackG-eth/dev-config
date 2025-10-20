-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['r'] = 'refresh',
          ['R'] = 'refresh',
        },
      },
      -- Auto-refresh when files change
      use_libuv_file_watcher = true,
      -- Refresh on focus
      refresh_on_focus = true,
      -- Refresh on write
      refresh_on_write = true,
    },
  },
}
