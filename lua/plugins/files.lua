return {
  {
    'echasnovski/mini.files',
    keys = {
      { "<A-`>", function() require('mini.files').open() end, desc = "File browser" }
    },
    opts = {
      use_as_default_explorer = false,
      mappings = {
        go_in = '',
        go_in_plus = 'l'
      }
    },
  },
}
