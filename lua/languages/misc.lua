local M = {}

M.treesitter = {
  "latex",
  "query",
  "terraform",
  "yuck",
  "bash",
  "fish",
  "norg",
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
