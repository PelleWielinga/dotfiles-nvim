local defaults = require("user.lsp.handlers")

local M = {}

local server_name = "rust_analyzer"

M.packages = function(use)
  use "simrat39/rust-tools.nvim"
end

M.setup = function()
  local rt = require("rust-tools")
  rt.setup()

  local lspconfig = require("lspconfig")
  lspconfig[server_name].setup({
    on_attach = defaults.on_attach,
    capabilities = defaults.capabilities,
  })
end

M.lsp = {
  mason = {
    name = server_name,
    auto_install = false,
  }
}

return M
