local M = {}

M.treesitter = {
  "rust",
}

M.lsp = {
  {
    name = "rust_analyzer",
    lsp_config = false,
    mason = false,
  },
}

M.plugins = {
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
  },
}

return M
