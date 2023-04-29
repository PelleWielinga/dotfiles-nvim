local options = {
  wrap = false,
  number = true,
  swapfile = false,

  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
