local user = require 'user.lib.helpers'

local telescope = require('telescope')
local builtin = require('telescope.builtin')

user.bind_key('n', ',fp', ':Telescope projects<CR>')
user.bind_key('n', ',ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
user.bind_key('n', ',fg', builtin.live_grep)
user.bind_key('n', ',fs', builtin.git_status)

-- Projects

local project_nvim = require('project_nvim')

telescope.load_extension('projects')

project_nvim.setup {
  detection_methods = {"pattern"},
  patterns = { ".git" },
}

user.bind_key('n', ',fr', project_nvim.get_recent_projects)

-- Media files

telescope.load_extension('media_files')

telescope.setup {
  extensions = {
    media_files = {
      filetypes = {"png", "jpg"},
    }
  },
}

