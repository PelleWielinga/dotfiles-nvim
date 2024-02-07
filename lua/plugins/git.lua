return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gr",
        function()
          require("gitsigns").reset_hunk()
        end,
        desc = "Reset hunk",
      },
      {
        "<leader>gd",
        function()
          require("gitsigns").diffthis()
        end,
        desc = "Diff this",
      },
      {
        "<leader>gp",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview hunk",
      },
    },
    opts = {},
  },

  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>gs",
        [[<cmd>Git<cr>]],
        desc = "Git status",
      },
    },
  },
}
