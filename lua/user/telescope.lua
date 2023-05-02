local telescope = require('telescope')

telescope.setup {
  extensions = {
    repo = {
      list = {
        cwd = "~/dev",
        search_dirs = { "~/dev" },
      },
    },

    media_files = {
      filetypes = {"png", "jpg"},
    }
  },
}

require('telescope').load_extension('repo')
telescope.load_extension('media_files')
