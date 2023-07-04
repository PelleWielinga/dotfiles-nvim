vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
  wrap = false,
  number = true,
  swapfile = false,
  termguicolors = true,
  clipboard = "unnamedplus",
  timeout = true,
  timeoutlen = 300,
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos",
  scrolloff = 9999,

  -- Maximum number of items to show in a popup menu. Useful for limiting
  -- options in autocompletion.
  pumheight = 10
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
