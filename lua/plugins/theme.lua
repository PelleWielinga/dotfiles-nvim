return {
  {
    "rebelot/kanagawa.nvim",

    -- Since start plugins can possibly change existing highlight groups,
    -- it's important to make sure that your main colorscheme is loaded first.
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa-dragon]])
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
      },
    },
  },

  {
    -- Nice spinner when loading lsp
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
