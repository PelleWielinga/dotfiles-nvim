local options = {
  wrap = false,
  number = true,
  swapfile = false,

  termguicolors = true,
  clipboard = "unnamedplus",

  timeout = true,
  timeoutlen = 300,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
