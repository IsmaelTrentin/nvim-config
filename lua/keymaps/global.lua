-- [[ Custom Keymaps ]]

local DESC_PREFIX = 'global: '

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = DESC_PREFIX .. 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = DESC_PREFIX .. 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = DESC_PREFIX .. 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = DESC_PREFIX .. 'Move focus to the upper window' })

-- Custom
vim.keymap.set('n', '<C-w>', ':bd<Enter>', { desc = DESC_PREFIX .. 'Close current buffer' })

-- [[ Editor ]]
vim.keymap.set('n', '∆', ':m +1<Enter>', { desc = DESC_PREFIX .. 'swap line down' })
vim.keymap.set('n', '˚', ':m -2<Enter>', { desc = DESC_PREFIX .. 'swap line up' })
-- tabs and spaces
vim.keymap.set('n', '<leader><C-4>', ':set shiftwidth=4 <Enter>:set tabstop=4 <Enter>:set expandtab <Enter>:ret <Enter>', { desc = DESC_PREFIX .. 'indent 4' })
vim.keymap.set('n', '<leader><C-2>', ':set shiftwidth=2 <Enter>:set tabstop=2 <Enter>:set expandtab <Enter>:ret <Enter>', { desc = DESC_PREFIX .. 'indent 2' })
