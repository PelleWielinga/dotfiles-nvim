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

  {
    "SuperBo/fugit2.nvim",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
        dependencies = { "stevearc/dressing.nvim" },
      },
      "sindrets/diffview.nvim", -- optional: for Diffview
    },
    cmd = { "Fugit2", "Fugit2Graph" },
    keys = {
      { "<leader>gf", mode = "n", "<cmd>Fugit2<cr>" },
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
    keys = {
      {
        "<leader>gn",
        [[<cmd>Neogit<cr>]],
        desc = "Neogit status",
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
