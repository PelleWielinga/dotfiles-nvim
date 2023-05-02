local telescope = require('telescope')

-- Projects

local project_nvim = require('project_nvim')

telescope.load_extension('projects')

project_nvim.setup {
  detection_methods = {"pattern"},
  patterns = { ".git" },
}

-- Media files

telescope.load_extension('media_files')

telescope.setup {
  extensions = {
    media_files = {
      filetypes = {"png", "jpg"},
    }
  },
}

