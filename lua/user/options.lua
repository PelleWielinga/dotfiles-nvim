local options = {
  wrap = false,
  number = true,
  swapfile = false,

  termguicolors = true,
  clipboard = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
