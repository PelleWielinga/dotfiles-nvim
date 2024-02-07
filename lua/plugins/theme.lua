return {
  {
    "folke/tokyonight.nvim",

    -- Since start plugins can possibly change existing highlight groups,
    -- it's important to make sure that your main colorscheme is loaded first.
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>nd",
        function()
          require("notify").dismiss()
        end,
        desc = "Dismiss notifications",
      },
    },
    config = function()
      vim.notify = require("notify")
      vim.notify.setup({
        render = "default",
        stages = "static",
        top_down = false,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        globalstatus = true,
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {},
  },

  {
    -- Nice spinner when loading lsp
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
