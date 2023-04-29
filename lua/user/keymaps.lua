local opts = { noremap = true, silent = true }

local key = vim.api.nvim_set_keymap
local vkey = vim.keymap.set

key('n', '<A-h>', ":bnext<CR>", opts)
key('n', '<A-l>', ":bprevious<CR>", opts)

-- Keep selection when changing indent
key('v', '<', '<gv', opts)
key('v', '>', '>gv', opts)

-------------
-- Plugins --
-------------

-- File tree
key('n', '<A-1>', ':NvimTreeToggle<CR>', opts)
key('i', '<A-1>', '<Esc>:NvimTreeToggle<CR>', opts)

-- Telescope
local builtin = require('telescope.builtin')
local project_nvim = require('project_nvim')

key('n', ',fp', ':Telescope projects<CR>', opts)
vkey('n', ',ff', builtin.find_files, opts)
vkey('n', ',fg', builtin.live_grep, opts)

vkey('n', ',fr', project_nvim.get_recent_projects, opts)
