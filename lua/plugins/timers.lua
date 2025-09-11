return {
  'ravsii/timers.nvim',
  version = '*', -- use latest stable release
  -- See below, empty is fine
  opts = {},
  keys = {
    { '<leader>T', '', desc = '+timers' },
    {
      '<leader>Ta',
      function()
        require('timers.ui').active_timers()
      end,
      desc = 'timers: Active timers',
    },
    {
      '<leader>Td',
      function()
        require('timers.ui').dashboard()
      end,
      desc = 'timers: Dashboard',
    },
    {
      '<leader>Tn',
      function()
        require('timers.ui').create_timer()
      end,
      desc = 'timers: New timer',
    },
    {
      '<leader>Tc',
      function()
        require('timers.ui').cancel()
      end,
      desc = 'timers: Cancel a timer',
    },
    {
      '<leader>TC',
      function()
        require('timers.ui').cancel_all()
      end,
      desc = 'timers: Cancel all timers',
    },
  },
}
