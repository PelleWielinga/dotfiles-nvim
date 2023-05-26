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
      require("nvim-autopairs").setup({})
    end
  },

  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
    },
    config = function ()
      require("leap").add_default_mappings()
    end
  },

  {
    "rmagatti/auto-session",
    config = function ()
      require("auto-session").setup({
        auto_session_allowed_dirs = { "~/dev/**" },
      })
    end
  }
}
