local wk = require('which-key')

local telescope = require('telescope.builtin')

vim.api.nvim_set_var("mapleader", ",")

wk.register({

  t = {
    name = "Test",
    f = { ":w<CR>:TestFile<CR>", "Test file" },
    a = { ":wa<CR>:TestSuite<CR>", "Test all" },
    l = { ":w<CR>:TestLast<CR>", "Test last" }, -- What does this do?
  },

  f = {
    name = "Find",
    p = { "<cmd>Telescope repo<CR>", "Find projects" },
    f = { "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", "Find files"},
    g = { telescope.live_grep, "Grep" },
    s = { telescope.git_status, "Changed files" },
  },

}, { prefix = "," })

