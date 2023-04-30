local nvim_tree_view = require 'nvim-tree.view'
local fns = require 'user.lib.helpers'

local function nvim_toggle_or_exit()
  fns.ensure_normal_mode()

  if nvim_tree_view.is_visible() then
    vim.cmd("NvimTreeClose")
  else
    vim.cmd("NvimTreeFindFile")
  end
end

fns.bind_key('n', '<A-1>', nvim_toggle_or_exit)
fns.bind_key('i', '<A-1>', nvim_toggle_or_exit)

