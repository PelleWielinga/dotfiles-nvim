local defaults = require("user.lsp.handlers")

local M = {}

local server_name = "lua_ls"

M.setup = function()
  local lspconfig = require("lspconfig")
  lspconfig[server_name].setup({
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
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
  })
end

M.lsp = {
  mason = {
    name = server_name,
    auto_install = false,
  }
}

return M

