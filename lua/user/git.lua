local fns = require 'user.lib.helpers'

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    fns.bind_key('n', ',hr', gs.reset_hunk)
    fns.bind_key('n', ',hd', gs.diffthis)
    fns.bind_key('n', ',hp', gs.preview_hunk)
  end
}

