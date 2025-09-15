-- status line

-- edited components
local custom_location = {
  'location',
  -- uses the base location component but adds '/<#lines>'
  fmt = function(str)
    local upper_bound = math.max(0, string.len(str))
    local n_lines = vim.api.nvim_buf_line_count(0)
    return str:sub(0, upper_bound) .. '/' .. n_lines
  end,
}

-- custom components
local theme_colors = require('tokyonight.colors').setup()
local timers_comp = {
  function()
    local manager = require 'timers.manager'
    local active_count = manager.active_timers_num()

    if active_count == 0 then
      return ''
    end

    local closest = manager.get_closest_timer()
    local remaining = closest:expire_in()

    local output = ' | '
    if closest.title == 'timers.nvim' then
      return output .. remaining:into_hms()
    end
    return output .. closest.title .. ': ' .. remaining:into_hms()
  end,
  color = { fg = theme_colors.dark3 },
}

-- status line sections config
local sections_config = {
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      'filename',
      custom_location,
      'progress',
      'searchcount',
      'selectioncount',
      'diagnostics',
    },
    lualine_x = { 'buffers', timers_comp },
    lualine_y = { 'lsp_status' },
    lualine_z = { 'filetype' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

-- extension for the startup screen (alpha-nvim).
-- removes broken/irrelevant elements.
local alpha_ext = {
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { { 'datetime', style = '%H:%M:%S' } },
    lualine_z = { 'filetype' },
  },
  inactive_sections = sections_config.inactive_sections,
  filetypes = { 'alpha' },
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- fills from current theme: tokyonight
    local auto = require 'lualine.themes.auto'
    local theme_colors = require('tokyonight.colors').setup()
    auto.insert.a.bg = theme_colors.purple
    auto.insert.b.fg = theme_colors.purple
    auto.visual.a.bg = theme_colors.green
    auto.visual.b.fg = theme_colors.green

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = auto,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' }, --''  ▾ ▸ ◢ ◣
        disabled_filetypes = {
          -- 'alpha',
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = sections_config.sections,
      inactive_sections = sections_config.inactive_sections,
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {
        alpha_ext,
        'nvim-tree',
      },
    }
  end,
}
