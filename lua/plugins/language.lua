return {
  -- Clojure
  {
    "Olical/conjure",
    ft = { "clojure" },
  },
  {
    "guns/vim-sexp",
    ft = { "clojure", "yuck" },
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    ft = { "clojure", "yuck" },
  },

  -- Golang
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod', 'templ' },
  },

  -- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
  },

  -- Web
  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "sass", "scss" },
    opts = {
      user_default_options = {
        rgb_fn = true,
        hsl_fn = true,
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        autotag = {
          enable = true,
        }
      }
    end
  }
}
