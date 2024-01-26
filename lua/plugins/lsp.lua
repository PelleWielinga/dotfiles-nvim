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
        ensure_installed = {
          "c",
          "clojure",
          "cpp",
          "css",
          "go",
          "haskell",
          "html",
          "java",
          "javascript",
          "kotlin",
          "lua",
          "php",
          "python",
          "query",
          "rust",
          "scss",
          "svelte",
          "terraform",
          "tsx",
          "twig",
          "typescript",
          "vim",
          "vimdoc",
          "yuck",
        },
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
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local defaults = {
        "gopls",
        "sqlls",
        "tsserver",
        "cssls",
        "rnix",
        "hls",
        "svelte",
        "clojure_lsp",
      }

      for _, v in pairs(defaults) do
        lspconfig[v].setup({ capabilities = capabilities })
      end

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "describe" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      lspconfig["jsonls"].setup({
        on_attach = function(_, bufnr)
          require("which-key").register({
            ["<leader>rj"] = { "<cmd>%!jq .<cr>", "Format json" },
          }, { bufnr = bufnr })
        end,
        capabilities = capabilities,
      })

      lspconfig["phpactor"].setup({
        capabilities = capabilities,
        init_options = {
          ["language_server_phpstan.enabled"] = true,
          ["language_server_psalm.enabled"] = true,
        },
      })

      lspconfig["pyright"].setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      })
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
      require("mason").setup({})

      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "sqlls", "tsserver" },
        automatic_installation = {
          exclude = { "rust_analyzer", "lua_ls", "clojure_lsp", "phpactor", "pyright" },
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
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        markdown = { "prettier" },
        php = { "php" },
      },
      notify_on_error = true,
      formatters = {
        php = {
          command = "./vendor/bin/php-cs-fixer",
          args = {
            "fix",
            "$FILENAME",
          },
          stdin = false,
        },
      },
    },
  },

  -- Rust
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("rust-tools").setup({
        server = {
          capabilities = capabilities,
        },
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

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

  -- Other stuff

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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>d", "<cmd>Trouble<cr>", desc = "Open Trouble window" },
    },
  },

  -- Tests
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
