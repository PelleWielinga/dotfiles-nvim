local user = require 'user.lib.helpers'
local wk = require 'which-key'

user.bind_key('n', '<A-l>', ":bnext<CR>")
user.bind_key('n', '<A-h>', ":bprevious<CR>")

-- Keep selection when changing indent
user.bind_key('v', '<', '<gv')
user.bind_key('v', '>', '>gv')

-- Tab movement
wk.register({
  ["<C-h>"] = { [[<Cmd>wincmd h<CR>]], "Focus split to the left" },
  ["<C-l>"] = { [[<Cmd>wincmd l<CR>]], "Focus split to the right" },
  ["<C-j>"] = { [[<Cmd>wincmd j<CR>]], "Focus split to below" },
  ["<C-k>"] = { [[<Cmd>wincmd k<CR>]], "Focus split to above" }
}, {
  mode = { "t", "i", "n" },
})

user.bind_key('n', '<C-x>', ':wa<cr>:qa<cr>')
