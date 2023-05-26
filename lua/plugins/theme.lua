return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end
  },

  {
    "startup-nvim/startup.nvim",
    config = function()
      require("startup").setup()
    end
  },

  {
    "akinsho/bufferline.nvim",
    dependencies = { "moll/vim-bbye" },
    config = function()
      require("bufferline").setup {
        options = {
          offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        },
      }
    end
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    config = function()
      require("noice").setup({})
    end
  }
}
