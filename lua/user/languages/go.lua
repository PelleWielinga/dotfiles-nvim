local defaults = require("user.lsp.handlers")

local M = {}

local server_name = "gopls"

M.setup = function()
  local lspconfig = require("lspconfig")
  lspconfig[server_name].setup({
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
  })
end

M.lsp = {
  mason = {
    name = server_name,
    auto_install = true,
  }
}

return M
