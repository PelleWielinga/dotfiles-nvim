local M = {}

M.treesitter = {
  "lua",
  "vim",
  "vimdoc",
}

M.lsp = {
  {
    name = "lua_ls",
    mason = false,
    setup = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "describe" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    },
  },
}

return M
