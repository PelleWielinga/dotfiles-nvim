local user = require 'user.lib.helpers'

user.bind_key('n', '<A-l>', ":bnext<CR>")
user.bind_key('n', '<A-h>', ":bprevious<CR>")

-- Keep selection when changing indent
user.bind_key('v', '<', '<gv')
user.bind_key('v', '>', '>gv')

-------------
-- Plugins --
-------------

-- Telescope
local builtin = require('telescope.builtin')
local project_nvim = require('project_nvim')

user.bind_key('n', ',fp', ':Telescope projects<CR>')
user.bind_key('n', ',ff', builtin.find_files)
user.bind_key('n', ',fg', builtin.live_grep)

user.bind_key('n', ',fr', project_nvim.get_recent_projects)
