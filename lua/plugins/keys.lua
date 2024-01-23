return {
  "folke/which-key.nvim",
  lazy = false,
  priority = 999,
  config = function()
    local wk = require('which-key')

    wk.register({
      ["<A-l>"] = { ":bnext<cr>", "Next buffer" },
      ["<A-h>"] = { ":bprevious<cr>", "Previous buffer" },
      ["<C-x>"] = { ":wa<cr>:qa<cr>", "Save and close all" },

      -- Redefined down/up half a screen to be a bit slower. Easier to track across the screen.
      ["<C-d>"] = { "10j", "Move down fast" },
      ["<C-u>"] = { "10k", "Move up fast" },

      ["<leader>"] = {
        f = { name = "Find" },
        h = { name = "Git" },
        k = { "<cmd>!kitty &<cr>", "Open kitty in project root" },
        b = {
          name = "Buffer actions",
          d = { [[<cmd>bn<cr><cmd>bd#<cr>]], "Close buffer without closing window" }
        },
        r = {
          -- This should be configured using LSP, but the current formatting is a bit crappy
          j = { "<cmd>%!jq .<cr>", "Format json" }
        }
      }
    })

    wk.register({
      [">"] = { ">gv", "Shift right" },
      ["<"] = { "<gv", "Shift left" },
      ["o"] = { "A<esc>o", "Insert newline after selection" },
      ["O"] = { "I<esc>O", "Insert newline before selection" },
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
