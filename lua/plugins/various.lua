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
    opts = {},
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
    "folke/todo-comments.nvim",
    -- Loaded on startup for highlighting
    event = "VeryLazy",
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next TODO",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous TODO",
      },
      { "<leader>fd", "<cmd>TodoTelescope<cr>", desc = "Telescope TODO" },
      { "<leader>df", "<cmd>TodoTrouble keywords=FIX<cr>", desc = "Trouble FIX" },
      { "<leader>if", function ()
        local api = require("Comment.api")
        local config = require("Comment.config"):get()

        api.insert.linewise.above(config)
        -- Why is this a? i is not working.
        vim.api.nvim_feedkeys("FIX: ", "a", true)
      end, desc = "Trouble FIX" },
    },
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate").configure({
        min_count_to_highlight = 2,
      })
    end,
  },
  {
    "willothy/savior.nvim",
    dependencies = { "j-hui/fidget.nvim" },
    event = { "InsertEnter", "TextChanged" },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {},
  },
}
