local utils = require("config.utils")

local packages = {
  "clojure",
  "c",
  "data",
  "go",
  "haskell",
  "java",
  "lua",
  "misc",
  "nix",
  "php",
  "python",
  "rust",
  "web",
}

local default_module = {
  treesitter = {},
  lsp = {},
  conform = {},
  linters = {},
  plugins = {},
}

local default_lsp = {
  name = nil,
  lsp_config = true,
  mason = true,
  setup = {},
}

local lsp_config = {}

local M = {
  treesitter = {},
  mason_include = {},
  mason_exclude = {},
  plugins = {},
  conform = {}, -- formatting
  linters = {},
}

for _, pack in pairs(packages) do
  local require_ok, module_conf = pcall(require, "languages." .. pack)
  if require_ok then
    local module = utils.table_merge_copy(default_module, module_conf)

    for _, ts in pairs(module.treesitter) do
      table.insert(M.treesitter, ts)
    end

    for _, lsp_conf in pairs(module.lsp) do
      local lsp = utils.table_merge_copy(default_lsp, lsp_conf)

      if lsp.mason then
        table.insert(M.mason_include, lsp.name)
      else
        table.insert(M.mason_exclude, lsp.name)
      end

      if lsp.lsp_config then
        lsp_config[lsp.name] = lsp.setup
      end
    end

    utils.table_merge(M.conform, module.conform)
    utils.table_merge(M.linters, module.linters)

    for _, plugin in pairs(module.plugins) do
      table.insert(M.plugins, plugin)
    end
  end
end

function M.setup_lsp()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  for name, setup in pairs(lsp_config) do
    setup.capabilities = capabilities
    lspconfig[name].setup(setup)
  end
end


return M
