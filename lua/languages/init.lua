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

local lsp_config = {}

local M = {
  treesitter = {},
  mason_include = {},
  mason_exclude = {},
  plugins = {},
}

for _, pack in pairs(packages) do
  local require_ok, module = pcall(require, "languages." .. pack)
  if require_ok then
    for _, ts in pairs(module.treesitter) do
      table.insert(M.treesitter, ts)
    end

    if module.lsp == nil then
      module.lsp = {}
    end

    for _, lsp in pairs(module.lsp) do
      if lsp.mason == nil or lsp.mason then
        table.insert(M.mason_include, lsp.name)
      else
        table.insert(M.mason_exclude, lsp.name)
      end

      if lsp.lsp_config == nil or lsp.lsp_config then
        if lsp.setup ~= nil then
          lsp_config[lsp.name] = lsp.setup
        else
          lsp_config[lsp.name] = {}
        end
      end
    end

    if module.plugins ~= nil then
      for _, plugin in pairs(module.plugins) do
        table.insert(M.plugins, plugin)
      end
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
