local tree = require('nvim-tree.api').tree
local fns = require 'user.lib.helpers'

local function nvim_toggle_or_exit()
  fns.ensure_normal_mode()

  if tree.is_tree_buf() then
    tree.close()
  else
    tree.open({ find_file = true })
  end
end

fns.bind_key('n', '<A-1>', nvim_toggle_or_exit)
fns.bind_key('i', '<A-1>', nvim_toggle_or_exit)

