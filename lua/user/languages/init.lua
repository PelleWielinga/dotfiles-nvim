local M = {}

local language_keys = {
  "rust",
  "typescript",
  "lua",
  "go",
  "python"
}

local modules = {}

for _, lang in pairs(language_keys) do
  local require_ok, module = pcall(require, "user.languages." .. lang)

  if require_ok then
    modules[lang] = module
  end
end

M.packages = function(use)
  for _, module in pairs(modules) do
    if module.packages ~= nil then
      module.packages(use)
    end
  end
end

M.setup = function()
  for _, module in pairs(modules) do
    if module.setup ~= nil then
      module.setup()
    end
  end
end

local mason_servers = {}
local mason_excludes = {}
for _, module in pairs(modules) do
  if module.lsp.mason.auto_install == false then
    table.insert(mason_excludes, module.lsp.mason.name)
  else
    table.insert(mason_servers, module.lsp.mason.name)
  end
end

M.lsp = {
  mason = {
    servers = mason_servers,
    excludes = mason_excludes
  }
}

M.modules = modules

return M
