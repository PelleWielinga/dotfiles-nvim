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

M.conform = {
  formatters_by_ft = {
    python = { "isort", "black" },
  },
}

return M
