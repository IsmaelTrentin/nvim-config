return {
  'mbbill/undotree',
  lazy = false,
  config = function()
    vim.cmd 'let g:undotree_WindowLayout = 3'
    vim.cmd 'let g:undotree_ShortIndicators = 1'
    vim.cmd 'let g:undotree_SetFocusWhenToggle = 1'
  end,
  keys = {
    {
      '<leader>u',
      vim.cmd.UndotreeToggle,
      desc = 'undotree: toggle',
    },
  },
}
