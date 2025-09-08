-- autocmds
vim.api.nvim_create_autocmd('User', {
  pattern = 'OilActionsPost',
  callback = function(event)
    if event.data.actions.type == 'move' then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})

local prev = { new_name = '', old_name = '' } -- Prevents duplicate events
vim.api.nvim_create_autocmd('User', {
  pattern = 'NvimTreeSetup',
  callback = function()
    local events = require('nvim-tree.api').events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})

-- keybinds

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    local theme_colors = require('tokyonight.colors').setup()

    require('snacks').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      input = { enabled = true },
      scroll = { enabled = true },
      rename = { enabled = true },
      zen = { enabled = true },
      animate = {
        enabled = true,
        duration = 15, -- ms per step
        easing = 'cubic',
        fps = 60, -- frames per second. Global setting for all animations
      },
      explorer = {
        enabled = true,
      },
      lazygit = {
        enabled = true,
        configure = true,
      },
      terminal = {
        enabled = true,
        win = { style = 'terminal' },
      },
    }
  end,
}
