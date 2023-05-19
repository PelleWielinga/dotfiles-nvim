local wk = require('which-key')

local telescope = require('telescope.builtin')

vim.api.nvim_set_var("mapleader", ",")

wk.register({

  f = {
    name = "Find",
    p = { "<cmd>Telescope repo<CR>", "Find projects" },
    f = { "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", "Find files"},
    g = { telescope.live_grep, "Grep" },
    s = { telescope.git_status, "Changed files" },
  },

  d = {
    name = "Diagnostics",
    o = { vim.diagnostic.open_float, "View diagnostic" },
    h = { vim.lsp.buf.hover, "Hover?" },
  },

  r = {
    name = "Refactor",
    f = { vim.lsp.buf.format, "Format code" },
    r = { vim.lsp.buf.rename, "Rename variable" },
  },

  x = {
    name = "Execute project command"
    -- The project commands are defined in other places
  },

}, { prefix = "<leader>" })

