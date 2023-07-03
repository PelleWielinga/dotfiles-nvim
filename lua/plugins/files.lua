return {
  {
    'echasnovski/mini.files',
    config = function()
      local mf = require('mini.files')
      local wk = require('which-key')

      mf.setup({
        use_as_default_explorer = false,
        mappings = {
          go_in = '',
          go_in_plus = 'l'
        }
      })

      wk.register({
        ["<A-`>"] = { function() mf.open() end, "File browser" },
      })
    end
  },
}
