local function lsp_keymaps(bufnr)
  local tsb = require("telescope.builtin")

  local function next_diagnostic()
    vim.diagnostic.goto_next({ border = "rounded" })
  end

  local function prev_diagnostic()
    vim.diagnostic.goto_prev({ border = "rounded" })
  end

  local function goto_references()
    tsb.lsp_references()
  end

  require("which-key").register({
    ["<leader>"] = {
      q = { vim.diagnostic.setloclist, "Set loc list" },
      r = {
        name = "Refactor",
        f = { vim.lsp.buf.format, "Format code" },
        r = { vim.lsp.buf.rename, "Rename variable" },
      },
    },
    g = {
      D = { vim.lsp.buf.declaration, "Goto declaration" },
      d = { vim.lsp.buf.definition, "Goto definition" },
      i = { vim.lsp.buf.implementation, "Goto implementation" },
      r = { goto_references, "Goto references" },
      l = { vim.diagnostic.open_float, "Open diagnostic float" }, -- Duplicate binding?
    },
    K = { vim.lsp.buf.hover, "Hover" },
    ["<C-Space>"] = { vim.lsp.buf.code_action, "Code actions" },
    ["[d"] = { prev_diagnostic, "Goto previous diagnostic" },
    ["]d"] = { next_diagnostic, "Goto next diagnostic" },
  }, { bufnr = bufnr })

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local function on_attach(_, bufnr)
  lsp_keymaps(bufnr)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "java", "clojure", "kotlin", "twig", "rust", "nix", "php" },
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig["gopls"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig["lua_ls"].setup({
        on_attach = on_attach,
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
        }
      })

      lspconfig["sqlls"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig["tsserver"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig["rnix"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig["jsonls"].setup({
        on_attach = function(x, bufnr)
          on_attach(x, bufnr)
          require("which-key").register({
            ["<leader>rj"] = { "<cmd>%!jq .<cr>", "Format json" }
          }, { bufnr = bufnr })
        end,
        capabilities = capabilities
      })

      lspconfig["clojure_lsp"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig["intelephense"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })

      lspconfig["pyright"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        }
      })
    end
  },

  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim"
    },
    config = function()
      require("mason").setup({})

      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "sqlls", "tsserver", "pyright", "rnix", "intelephense" },
        automatic_installation = {
          exclude = { "rust_analyzer", "lua_ls", "clojure_lsp" },
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = { "rustfmt" }
      })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = { null_ls.builtins.formatting.rustfmt },
      })
    end
  },

  -- Rust
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("rust-tools").setup({
        server = {
          on_attach = on_attach,
          capabilities = capabilities
        }
      })
    end,
  },

  -- Clojure
  {
    "Olical/conjure",
    ft = { "clojure" }
  },

  {
    "ap/vim-css-color",
    ft = { "css", "sass", "scss" }
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>d", "<cmd>Trouble<cr>", desc = "Open Trouble window" }
    }
  },

  -- Tests
  {
    "nvim-neotest/neotest",
    dependencies = { "rouge8/neotest-rust" },
    keys = {
      {
        "<leader>to",
        function() require("neotest").output.open({ enter = true }) end,
        desc = "Show test output"
      },
      {
        "<leader>tn",
        function() require("neotest").run.run() end,
        desc = "Test nearest"
      },

      {
        "<leader>tl",
        function() require("neotest").run.run_last() end,
        desc = "Test last"
      },

      {
        "<leader>tf",
        function() require("neotest").run.run(vim.fn.expand("%")) end,
        desc = "Test file"
      }
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"),
        }
      })
    end
  }
}
