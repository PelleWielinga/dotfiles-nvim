require("plugins")

require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', '<A-1>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-1>', '<Esc>:NvimTreeToggle<CR>', { noremap = true, silent = true })

local telescope = require('telescope')
local builtin = require('telescope.builtin')
vim.keymap.set('n', ',ff', builtin.find_files, {})

telescope.load_extension('projects')

vim.api.nvim_set_keymap('n', ',fp', ':Telescope projects<CR>', { noremap = true, silent = true })

local project_nvim = require('project_nvim')
project_nvim.setup()
vim.keymap.set('n', ',fr', project_nvim.get_recent_projects, {})

vim.opt.wrap = false
vim.opt.number = true
