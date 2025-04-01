return {
  "folke/which-key.nvim",
  lazy = false,
  priority = 999,
  config = function()
    local wk = require("which-key")

    local function next_diagnostic()
      vim.diagnostic.goto_next({ border = "rounded" })
    end

    local function prev_diagnostic()
      vim.diagnostic.goto_prev({ border = "rounded" })
    end

    wk.add({
      { "<c-x>", ":wqa!<cr>", desc = "Save and close all" },
      { "<leader>c", vim.lsp.buf.code_action, desc = "Code actions" },

      { "<leader>b", group = "Buffer actions" },
      {
        "<leader>bd",
        "<cmd>bn<cr><cmd>bd#<cr>",
        desc = "Close buffer without closing window",
      },

      { "<leader>d", group = "Debug" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>o", group = "Oil" },

      { "<leader>l", group = "LSP" },
      { "<leader>ls", vim.lsp.buf.type_definition, desc = "Signature help" },
      {
        "<leader>lt",
        vim.lsp.buf.signature_help,
        desc = "Goto type definition",
      },

      { "<leader>m", group = "Molten" },

      { "<leader>r", group = "Refactor" },
      { "<leader>rr", vim.lsp.buf.rename, desc = "Rename variable" },

      { "<leader>t", group = "Test" },
      { "<leader>x", group = "Extra" },

      { "K", vim.lsp.buf.hover, desc = "Hover" },

      { "[:", prev_diagnostic, desc = "Previous diagnostic" },
      { "[d", prev_diagnostic, desc = "Previous diagnostic" },
      { "]:", next_diagnostic, desc = "Next diagnostic" },
      { "]d", next_diagnostic, desc = "Next diagnostic" },

      { "gl", vim.diagnostic.open_float, desc = "Open diagnostic float" },

      {
        "<",
        "<gv",
        desc = "Shift left",
        mode = "v",
      },
      {
        ">",
        ">gv",
        desc = "Shift right",
        mode = "v",
      },

      {
        mode = { "n", "v" },
        -- Redefined down/up half a screen to be a bit slower. Easier to track across the screen.
        { "<C-d>", "10j", desc = "Move down fast" },
        { "<C-u>", "10k", desc = "Move up fast" },
        { "<PageDown>", "10j", desc = "Move down fast" },
        { "<PageUp>", "10k", desc = "Move up fast" },
      },

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
