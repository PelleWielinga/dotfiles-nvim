local wk = require('which-key')

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    wk.register({
      h = {
        name = "Git signs",
        r = { gs.reset_hunk, "Reset hunk" },
        d = { gs.diffthis, "Diff this" },
        p = { gs.preview_hunk, "Preview hunk" },
      },
    }, { prefix = "," })
  end
}

