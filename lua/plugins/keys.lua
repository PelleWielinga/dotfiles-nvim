return {
  "folke/which-key.nvim",
  config = function()
    local wk = require('which-key')

    wk.register({
      ["<A-l>"] = { ":bnext<cr>", "Next buffer" },
      ["<A-h>"] = { ":bprevious<cr>", "Previous buffer" },
      ["<C-x>"] = { ":wa<cr>:qa<cr>", "Save and close all" },
    })

    wk.register({
      [">"] = { ">gv", "Shift right" },
      ["<"] = { "<gv", "Shift left" }
    }, { mode = "v" })

    wk.register({
      ["<C-h>"] = { [[<Cmd>wincmd h<CR>]], "Focus split to the left" },
      ["<C-l>"] = { [[<Cmd>wincmd l<CR>]], "Focus split to the right" },
      ["<C-j>"] = { [[<Cmd>wincmd j<CR>]], "Focus split to below" },
      ["<C-k>"] = { [[<Cmd>wincmd k<CR>]], "Focus split to above" }
    }, {
      mode = { "t", "i", "n" },
    })
  end
}
