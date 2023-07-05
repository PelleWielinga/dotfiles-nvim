return {
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "scheme", "list", "clojure" }
      })
    end
  },

  {
    "folke/flash.nvim",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash", },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash", },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search",
      },
    },
  },

  {
    "terrortylor/nvim-comment",
    keys = {
      { "<leader>cc", "<cmd>CommentToggle<cr>", desc = "Toggle comment" },
    },
    opts = {
      create_mappings = false
    },
    config = function()
      require("nvim_comment").setup({ create_mappings = false })
    end
  },

  { "folke/persistence.nvim",                     event = "BufReadPre", opts = {} },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        min_count_to_highlight = 2,
      })
    end
  },

  -- TODO: This should not be here
  { "guns/vim-sexp",                              ft = "clojure" },
  { "tpope/vim-sexp-mappings-for-regular-people", ft = "clojure" }
}
