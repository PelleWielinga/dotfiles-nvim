local M = {}

M.treesitter = {
  "python",
}

M.lsp = {
  {
    name = "pyright",
    mason = false,
    setup = {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
          },
        },
      },
    },
  },
}

return M
