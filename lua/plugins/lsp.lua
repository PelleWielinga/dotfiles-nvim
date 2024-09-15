return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-m>",
            node_incremental = "<C-m>",
            node_decremental = "<C-S-m>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
        ensure_installed = "all",
      })
    end,
  },
  {
    "nvim-treesitter/playground",
    keys = {
      {
        "<leader>et",
        "<cmd>TSPlaygroundToggle<cr>",
        desc = "TreeSitter playground toggle",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    keys = {
      {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        desc = "LSP info",
      },
      {
        "<leader>lr",
        "<cmd>LspRestart<cr>",
        desc = "LSP restart",
      },
    },
    config = function()
      require("languages").setup_lsp()
    end,
  },

  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local languages = require("languages")

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = languages.mason_include,
        automatic_installation = {
          exclude = languages.mason_exclude,
        },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics open focus=true<cr>", desc = "Trouble diagnostics" },
      { "<leader>xc", "<cmd>Trouble symbols open focus=true<cr>", desc = "Trouble symbols" },
      { "<leader>xr", "<cmd>Trouble lsp open focus=true<cr>", desc = "Trouble lsp" },
    },
    config = function()
      require("trouble").setup({
        auto_close = true,
      })

      local open_with_trouble = require("trouble.sources.telescope").open
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
          },
        },
      })
    end,
  },
}
