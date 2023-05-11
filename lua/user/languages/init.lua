local M = {}

local language_keys = {
  --"go",
  "rust"
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
    module.packages(use)
  end
end

M.setup = function(use)
  for _, module in pairs(modules) do
    module.setup()
  end
end

return M
