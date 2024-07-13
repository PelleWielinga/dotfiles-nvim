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
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      }

      require("conform").setup(utils.table_merge(opts, languages.conform))
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

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
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
        "<leader>tp",
        function()
          require("neotest").output_panel.open({ enter = true })
        end,
        desc = "Show test output panel",
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
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Watch file",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Test file",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Test file",
      },
      {
        "<leader>ts",
        [[<cmd>Neotest summary<cr>]],
        desc = "Test summary",
      },
      {
        "]n",
        function()
          require("neotest").jump.next({ status = "failed" })
        end,
        desc = "Next failed test",
      },
      {
        "[n",
        function()
          require("neotest").jump.prev({ status = "failed" })
        end,
        desc = "Previous failed test",
      },
      -- Duplicates for magic strdy
      {
        "]=",
        function()
          require("neotest").jump.next({ status = "failed" })
        end,
        desc = "Next failed test",
      },
      {
        "[=",
        function()
          require("neotest").jump.prev({ status = "failed" })
        end,
        desc = "Previous failed test",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"),
          require("neotest-python")({
            args = { "-vv" },
            dap = { justMyCode = false },
          }),
          require("neotest-go"),
        },
      })
    end,
  },
}
