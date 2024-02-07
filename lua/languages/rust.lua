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
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("rust-tools").setup({
        server = {
          capabilities = capabilities,
        },
      })
    end,
  },
}

return M
