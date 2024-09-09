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
  conceallevel = 1,

  -- Maximum number of items to show in a popup menu. Useful for limiting
  -- options in autocompletion.
  pumheight = 10,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.neovide_scale_factor = 0.8

local autoupdatefile = vim.api.nvim_create_augroup("autoupdatefile", { clear = true })

-- vim.api.nvim_create_autocmd({ "BufNewFile" }, {
--   pattern = "*",
--   group = autoupdatefile,
--   callback = function(event)
--     -- vim.notify("new file")
--     vim.cmd("w " .. event.file)
--   end,
-- })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  group = autoupdatefile,
  callback = function(event)
    if event.file == "" then
      -- vim.notify("not a file")
    elseif vim.fn.filereadable(event.file) == 0 then
      -- vim.notify("bufdelete")
      -- vim.cmd("bdelete " .. event.buf)
    else
      -- vim.notify("checktime")
      vim.cmd("checktime " .. event.buf)
    end
  end,
})
