local user = require 'user.lib.helpers'

user.bind_key('n', '<A-l>', ":bnext<CR>")
user.bind_key('n', '<A-h>', ":bprevious<CR>")

-- Keep selection when changing indent
user.bind_key('v', '<', '<gv')
user.bind_key('v', '>', '>gv')
