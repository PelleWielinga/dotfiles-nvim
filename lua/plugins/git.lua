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
      {
        "<leader>gs",
        function()
          require("gitsigns").stage_hunk()
        end,
        desc = "Stage hunk",
      },
      {
        "<leader>gS",
        function()
          require("gitsigns").stage_buffer()
        end,
        desc = "Stage buffer",
      },
      {
        "<leader>gu",
        function()
          require("gitsigns").undo_stage_hunk()
        end,
        desc = "Undo stage hunk",
      },
    },
    opts = {},
  },
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>gf",
        [[<cmd>Git<cr>]],
        desc = "Git fugitive",
      },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    keys = {
      {
        "<leader>gb",
        [[<cmd>BlameToggle<cr>]],
        desc = "Toggle blame",
      },
    },
    config = function()
      require("blame").setup({
        date_format = "%Y-%m-%d",
        commit_detail_view = "tab",
      })
    end,
  },
}
