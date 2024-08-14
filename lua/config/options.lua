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
  scrolloff = 10,
  expandtab = true,
  tabstop = 4,
  shiftwidth = 4,
  cursorline = true,
  relativenumber = true,
  autoread = true,

  -- Maximum number of items to show in a popup menu. Useful for limiting
  -- options in autocompletion.
  pumheight = 10,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.neovide_scale_factor = 0.8

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  callback = function()
    local file_path = vim.fn.expand("%:p")
    local buftype = vim.bo.buftype

    if file_path == "" or buftype ~= "" then
      -- If the buffer does not represent a file, do nothing.
      return
    end

    if vim.fn.filereadable(file_path) == 0 then
      -- If the file doesn't exist, close the buffer
      vim.cmd("bdelete")
    else
      -- If the file exists, check for changes on disk
      vim.cmd("checktime")
    end
  end,
})
