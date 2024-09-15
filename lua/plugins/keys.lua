return {
  "folke/which-key.nvim",
  lazy = false,
  priority = 999,
  config = function()
    local wk = require("which-key")

    wk.add({
      { "<c-x>", ":wqa!<cr>", desc = "Save and close all" },
      { "<leader>b", group = "Buffer actions" },
      { "<leader>bd", "<cmd>bn<cr><cmd>bd#<cr>", desc = "Close buffer without closing window" },

      { "<leader>d", group = "Debug" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>o", group = "Oil" },

      { "<leader>l", group = "LSP" },
      { "<leader>ls", vim.lsp.buf.type_definition, desc = "Signature help" },
      { "<leader>lt", vim.lsp.buf.signature_help, desc = "Goto type definition" },
      { "<leader>m", group = "Molten" },
      { "<leader>r", group = "Refactor" },
      { "<leader>t", group = "Test" },
      { "<leader>x", group = "Extra" },

      { "K", vim.lsp.buf.hover, desc = "Hover" },

      {
        mode = { "i", "n", "t" },
        { "<C-Down>", "<Cmd>wincmd j<CR>", desc = "Focus split to below" },
        { "<C-Left>", "<Cmd>wincmd h<CR>", desc = "Focus split to the left" },
        { "<C-Right>", "<Cmd>wincmd l<CR>", desc = "Focus split to the right" },
        { "<C-Up>", "<Cmd>wincmd k<CR>", desc = "Focus split to above" },
        { "<C-h>", "<Cmd>wincmd h<CR>", desc = "Focus split to the left" },
        { "<C-j>", "<Cmd>wincmd j<CR>", desc = "Focus split to below" },
        { "<C-k>", "<Cmd>wincmd k<CR>", desc = "Focus split to above" },
        { "<C-l>", "<Cmd>wincmd l<CR>", desc = "Focus split to the right" },
      },
    })
  end,
}
