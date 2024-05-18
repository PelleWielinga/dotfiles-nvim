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

    wk.register({
      ["<C-x>"] = { ":wa<cr>:qa<cr>", "Save and close all" },

      -- Redefined down/up half a screen to be a bit slower. Easier to track across the screen.
      ["<C-d>"] = { "10j", "Move down fast" },
      ["<PageDown>"] = { "10j", "Move down fast" },
      ["<C-u>"] = { "10k", "Move up fast" },
      ["<PageUp>"] = { "10k", "Move up fast" },

      ["<leader>"] = {
        a = { vim.lsp.buf.code_action, "Code actions" },
        f = { name = "Find" },
        g = { name = "Git" },
        l = {
          name = "LSP",
          t = { vim.lsp.buf.type_definition, "Goto type definition" },
          s = { vim.lsp.buf.signature_help, "Signature help" },
        },
        b = {
          name = "Buffer actions",
          d = { [[<cmd>bn<cr><cmd>bd#<cr>]], "Close buffer without closing window" },
        },
        r = {
          name = "Refactor",
          r = { vim.lsp.buf.rename, "Rename variable" },
        },
      },

      g = {
        D = { vim.lsp.buf.declaration, "Goto declaration" },
        d = { vim.lsp.buf.definition, "Goto definition" },
        i = { vim.lsp.buf.implementation, "Goto implementation" },
        l = { vim.diagnostic.open_float, "Open diagnostic float" }, -- Duplicate binding?
      },

      K = { vim.lsp.buf.hover, "Hover" },

      ["[d"] = { prev_diagnostic, "Previous diagnostic" },
      ["]d"] = { next_diagnostic, "Next diagnostic" },
    })

    wk.register({
      [">"] = { ">gv", "Shift right" },
      ["<"] = { "<gv", "Shift left" },
    }, { mode = "v" })

    wk.register({
      ["<C-h>"] = { [[<Cmd>wincmd h<CR>]], "Focus split to the left" },
      ["<C-l>"] = { [[<Cmd>wincmd l<CR>]], "Focus split to the right" },
      ["<C-j>"] = { [[<Cmd>wincmd j<CR>]], "Focus split to below" },
      ["<C-k>"] = { [[<Cmd>wincmd k<CR>]], "Focus split to above" },

      ["<C-Left>"] = { [[<Cmd>wincmd h<CR>]], "Focus split to the left" },
      ["<C-Right>"] = { [[<Cmd>wincmd l<CR>]], "Focus split to the right" },
      ["<C-Down>"] = { [[<Cmd>wincmd j<CR>]], "Focus split to below" },
      ["<C-Up>"] = { [[<Cmd>wincmd k<CR>]], "Focus split to above" },
    }, {
      mode = { "t", "i", "n" },
    })
  end,
}
