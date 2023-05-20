local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local function on_attach(client, bufnr)
  lsp_keymaps(bufnr)
end

local function setup(use)
  use({
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    config = function()
      require("mason").setup({})
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    requires = { "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
    after = { "mason.nvim" },
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

      lspconfig["rust_analyzer"].setup({
        on_attach = on_attach,
        capabilities = capabilities
      })
    end,
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    after = { "mason.nvim" },
    requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "sqlls", "tsserver", "pyright" },
        automatic_installation = {
          exclude = { "rust_analyzer", "lua_ls" },
        },
      })
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({})
    end
  })

  use({
    "simrat39/rust-tools.nvim",
    after = { "nvim-lspconfig" },
    config = function()
      require("rust-tools").setup()
    end,
  })

  -- Python
  use("dccsillag/magma-nvim")

  use({
    -- Nice spinner when loading lsp
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  })
end

return { setup = setup }
