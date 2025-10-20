-- indent lines
local IBL_CHAR = '│'

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    -- nvim 'list' replaces tab_char
    --  but `set nolist` has weird behaviour with col0
    indent = { char = IBL_CHAR, tab_char = IBL_CHAR },
    -- disable styling to get a slimmer bar
    -- and make it consistent to the nvim list tab char
    whitespace = { highlight = {} },
  },
  config = function()
    require('ibl').setup()
  end,
}
