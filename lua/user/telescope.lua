local telescope = require('telescope')
local project_nvim = require('project_nvim')

telescope.load_extension('projects')
telescope.load_extension('media_files')

project_nvim.setup()

telescope.setup {
  extensions = {
    media_files = {
      filetypes = {"png", "jpg"},
    }
  },
}

