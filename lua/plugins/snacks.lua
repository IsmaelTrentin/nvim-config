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

---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd('LspProgress', {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= 'table' then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ('[%3d%%] %s%s'):format(
            value.kind == 'end' and 100 or value.percentage or 100,
            value.title or '',
            value.message and (' **%s**'):format(value.message) or ''
          ),
          done = value.kind == 'end',
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(table.concat(msg, '\n'), 'info', {
      id = 'lsp_progress',
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('snacks').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below

      -- styles (https://github.com/folke/snacks.nvim/blob/main/docs/styles.md)
      styles = {
        notification_history = {
          wo = { winhighlight = '' },
        },
      },

      -- plugins
      input = { enabled = true },
      scroll = { enabled = false }, -- this fucks up cursor smear
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
      notifier = {
        enabled = true,
        top_down = false,
        margin = { bottom = 2, right = 0, top = 0 },
        width = { min = 25, max = 0.2 },
      },
    }
  end,
  keys = {
    -- notifier
    {
      '<leader>nh',
      function()
        require('snacks').notifier.show_history(nil)
      end,
      'snacks.notifier: show history',
    },
  },
}
