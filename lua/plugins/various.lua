return {
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "scheme", "list", "clojure" },
      })
    end,
  },

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    keys = {
      { "<leader>mi", "<cmd>MoltenInit<cr>", desc = "Molten init" },
      { "<leader>mx", "<cmd>MoltenRestart<cr>", desc = "Molten restart" },
      {
        "<leader>mm",
        "<cmd>MoltenEvaluateLine<cr>",
        desc = "Molten evaluate line",
      },
      {
        "<leader>me",
        "<cmd>MoltenEvaluateOperator<cr>",
        desc = "Molten evaluate operator",
      },
      {
        "<leader>me",
        "<cmd>MoltenEvaluateVisual<cr>",
        mode = "v",
        desc = "Molten evaluate selection",
      },
      {
        "<leader>mr",
        "<cmd>MoltenReevaluateCell<cr>",
        desc = "Molten re-evaluate cell",
      },
      { "]o", "<cmd>MoltenNext<cr>", desc = "Next Molten output" },
      { "[o", "<cmd>MoltenPrev<cr>", desc = "Previous Molten output" },
    },
    build = ":UpdateRemotePlugins",
    init = function() end,
  },
}
