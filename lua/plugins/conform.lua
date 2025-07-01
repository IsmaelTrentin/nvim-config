-- Autoformat
return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = true,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters = {
      prettierd = {
        prepend_args = {
          '--single-quote',
          '--semi',
          '--tab-width 2',
          '--arrow-parens avoid',
          '--trailing-comma es5',
          '--bracket-spacing',
        },
      },
    },
    formatters_by_ft = {
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      lua = { 'stylua' },
      rust = { 'rust_analyzer' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}
