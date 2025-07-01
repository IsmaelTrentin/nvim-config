return {
  settings = {
    ['rust-analyzer'] = {
      procMacro = { enable = true },
      cargo = { allFeatures = true },
      checkOnSave = true,
      check = {
        command = 'clippy',
        extraArgs = { '--no-deps' },
      },
    },
  },
}
