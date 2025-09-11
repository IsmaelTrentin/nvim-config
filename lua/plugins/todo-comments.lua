-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = { signs = true },
  keys = {
    -- search todos is binded in Telescope config
    { '<leader>L', '<cmd>TodoLocList<cr>', desc = 'todo-comments: open todos location list' },
  },
}
