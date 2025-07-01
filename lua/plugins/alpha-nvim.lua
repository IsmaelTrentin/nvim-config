-- startup
return {
  'goolord/alpha-nvim',
  config = function()
    local dashv2 = require 'themes.alpha-themes.dashv2'
    local theme = dashv2

    require('alpha').setup(theme.config)
  end,
}
