local telescope = require('telescope')
local project_nvim = require('project_nvim')

telescope.load_extension('projects')

project_nvim.setup()
