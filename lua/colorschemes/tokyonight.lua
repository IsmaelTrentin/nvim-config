-- theme config
-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_moon.lua

return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('tokyonight').setup {
      style = 'moon',
      -- https://github.com/xiyaowong/transparent.nvim
      transparent = vim.g.transparent_enabled,

      on_colors = function(colors)
        -- set terminal to #14141a
        -- opacity 0.91
        colors.bg = '#1a1b26'
        colors.bg_float = '#1c1e2d'
        colors.purple = '#ae81ff'

        -- colors.bg_dark = '#1a1b26'
      end,

      on_highlights = function(hl, c)
        local colors = require('tokyonight.colors').setup()

        hl.TelescopePromptBorder.fg = colors.purple
        hl.TelescopePromptTitle.fg = colors.purple
      end,
    }

    vim.cmd.colorscheme 'tokyonight-moon'
    vim.cmd.hi 'Comment gui=none'
  end,
}
