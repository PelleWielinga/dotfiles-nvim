local M = {}

M.treesitter = {
  "python",
}

M.lsp = {
  {
    name = "pyright",
    mason = false,
    setup = {
    },
  },
}

M.conform = {
  formatters_by_ft = {
    python = { "isort", "black" },
  },
}

return M
