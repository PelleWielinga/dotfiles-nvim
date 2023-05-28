local wk = require("which-key")

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

  wk.register({
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
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "java", "kotlin", "twig", "rust" },
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
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
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim"
    },
    config = function()
      require("mason").setup({})

      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "sqlls", "tsserver", "pyright" },
        automatic_installation = {
          exclude = { "rust_analyzer", "lua_ls" },
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = { "rustfmt" }
      })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
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

  -- CSS
  "ap/vim-css-color",

  -- Nice spinner when loading lsp
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },

  -- Several error reporting improvements
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("trouble").setup({})
      local wk = require("which-key")

      wk.register({
        t = { "<cmd>Trouble<cr>", "Open Trouble window" },
      }, { prefix = "<leader>d" })
    end,
  },

  -- Tests
  {
    "nvim-neotest/neotest",
    dependencies = { "rouge8/neotest-rust" },
    config = function()
      local ntest = require("neotest")
      local wk = require("which-key")

      ntest.setup({
        adapters = {
          require("neotest-rust"),
        },
      })

      local test_nearest = function()
        vim.cmd(":wa")
        ntest.run.run()
      end

      local test_last = function()
        vim.cmd(":wa")
        ntest.run.run_last()
      end

      local test_file = function()
        vim.cmd(":wa")
        ntest.run.run(vim.fn.expand("%"))
      end

      local show_output = function()
        ntest.output.open({ enter = true })
      end

      wk.register({
        name = "Test",
        o = { show_output, "Show test output" },
        n = { test_nearest, "Test nearest" },
        l = { test_last, "Test last" },
        f = { test_file, "Test file" },
      }, { prefix = "<leader>t" })
    end,
  },
}
