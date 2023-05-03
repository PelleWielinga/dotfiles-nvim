local user = require 'user.lib.helpers'

user.bind_key('n', '<A-l>', ":bnext<CR>")
user.bind_key('n', '<A-h>', ":bprevious<CR>")

-- Keep selection when changing indent
user.bind_key('v', '<', '<gv')
user.bind_key('v', '>', '>gv')

user.bind_key('n', '<C-h>', '<C-w>h')
user.bind_key('n', '<C-l>', '<C-w>l')
user.bind_key('n', '<C-j>', '<C-w>j')
user.bind_key('n', '<C-k>', '<C-w>k')

user.bind_key('n', '<C-x>', ':wa<cr>:qa<cr>')
