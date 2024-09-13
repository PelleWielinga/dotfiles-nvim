vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
