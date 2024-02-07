local M = {}

M.treesitter = {
  "latex",
  "query",
  "terraform",
  "yuck",
  "bash",
  "fish",
}

M.lsp = {
  {
    name = "sqlls",
  },
}

M.plugins = {}

M.conform = {
  formatters_by_ft = {
    markdown = { "prettier" },
  },
}

return M
