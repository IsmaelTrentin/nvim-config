-- startup
return {
  'goolord/alpha-nvim',
  config = function()
    local theme = require 'themes.alpha-themes.dashv2'

    require('alpha').setup(theme.config)
  end,
}
