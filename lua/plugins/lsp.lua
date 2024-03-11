return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = "VeryLazy",
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
        ensure_installed = require("languages").treesitter,
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
        }
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>rf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
    config = function()
      local utils = require("config.utils")
      local languages = require("languages")

      local opts = {
        notify_on_error = true,
      }

      require("conform").setup(utils.table_merge(opts, languages.conform))
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require("lint").linters_by_ft = require("languages").linters

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>d", "<cmd>Trouble<cr>", desc = "Open Trouble window" },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-python",
    },
    keys = {
      {
        "<leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
        desc = "Show test output",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Test nearest",
      },

      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Test last",
      },

      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Test file",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"),
          require("neotest-python"),
        },
      })
    end,
  },
}
