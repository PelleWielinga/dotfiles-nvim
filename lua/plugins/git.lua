return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local wk = require('which-key')
    local gs = require("gitsigns")

    gs.setup {
      on_attach = function()
        wk.register({
          h = {
            name = "Git signs",
            r = { gs.reset_hunk, "Reset hunk" },
            d = { gs.diffthis, "Diff this" },
            p = { gs.preview_hunk, "Preview hunk" },
          },
        }, { prefix = "<leader>" })
      end
    }
  end
}
