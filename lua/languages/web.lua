local M = {}

M.treesitter = {
  "css",
  "html",
  "javascript",
  "scss",
  "svelte",
  "tsx",
  "typescript",
}

M.lsp = {
  {
    name = "cssls",
  },
  {
    name = "svelte",
  },
  {
    name = "tsserver",
  },
}

M.plugins = {
  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "sass", "scss" },
    opts = {
      user_default_options = {
        rgb_fn = true,
        hsl_fn = true,
      },
    },
  },
}

M.linters = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
}

return M
