return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  enabled = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 28,
      },
      filters = {
        enable = true,
        custom = { '.git', '.DS_Store' },
        exclude = { '.gitignore' },
      },
    }

    -- custom mappings
    local api = require 'nvim-tree.api'
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<leader>1', function()
      api.tree.toggle { focus = false }
    end, opts 'toggle')
    vim.keymap.set('n', '<leader>k', function()
      api.tree.collapse_all()
    end, opts 'collapse all')
    vim.keymap.set('n', '<leader>l', function()
      api.tree.expand_all()
    end, opts 'collapse all')
    vim.keymap.set('n', '<leader>h', function()
      api.tree.find_file {
        open = true,
        focus = false,
        update_root = false,
      }
    end, opts 'find file')
  end,
}
