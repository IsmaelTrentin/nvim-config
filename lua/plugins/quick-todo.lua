-- dooing is a cooler alternative but it has some weird server/network code

return {
  'jkallio/quick-todo.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('quick-todo').setup {
      width = 25, -- perc
    }
  end,
  keys = function()
    local todo_api = require 'quick-todo'

    return {
      { '<leader>0', todo_api.toggle_ui, desc = 'quick-todo: toggle todos ui' },
    }
  end,
}
