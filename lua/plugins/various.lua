return {
  {
    "rcarriga/nvim-notify",
    priority = 1000,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.notify = require("notify")
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      local ap = require("nvim-autopairs")
      ap.setup()
      ap.get_rules("'")[1].not_filetypes = { "scheme", "lisp", "clojure" }
    end
  },

  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
    },
    config = function()
      require("leap").add_default_mappings()
    end
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        debounce_delay = 2000,
        execution_message = {
          -- Disable the message on save
          message = function() return "" end
        }
      })
    end
  },

  {
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup({})
    end
  },

  -- {
  --   "rmagatti/auto-session",
  --   config = function()
  --     require("auto-session").setup({
  --       --         auto_session_allowed_dirs = { "~/dev/**" },
  --       auto_session_suppress_dirs = { "~/", "~/Downloads", "/" }
  --     })
  --   end
  -- },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        min_count_to_highlight = 2,
      })
    end
  },

  {
    "guns/vim-sexp"
  },

  {
    "tpope/vim-sexp-mappings-for-regular-people"
  }

}
