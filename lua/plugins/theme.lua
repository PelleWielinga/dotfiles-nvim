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
    config = function()
      vim.notify = require("notify")
    end
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    opts = {
      change_to_vcs_root = true,
      config = {
        week_header = {
          enable = true,
        }
      }
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "moll/vim-bbye" },
    opts = {},
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>hr", function() require("gitsigns").reset_hunk() end,   desc = "Reset hunk" },
      { "<leader>hd", function() require("gitsigns").diffthis() end,     desc = "Diff this" },
      { "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
    },
    opts = {},
  },

  {
    -- Nice spinner when loading lsp
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    tag = "legacy",
    opts = {},
  },
}
