local utils = require("config.utils")

local packages = {
  c = {
    treesitter = { "c", "cpp" },
  },

  clojure = {
    treesitter = {
      "clojure",
    },

    lsp = {
      {
        name = "clojure_lsp",
        mason = false,
      },
    },
  },

  data = {
    treesitter = { "json", "xml", "yaml", "toml" },
    lsp = { { name = "jsonls" } },
  },

  gleam = {},

  go = {
    treesitter = { "go", "templ" },
    lsp = {
      { name = "gopls", mason = false },
      { name = "templ" },
    },
    setup = function()
      vim.filetype.add({ extension = { templ = "templ" } })
    end,
    conform = {
      formatters_by_ft = {
        go = { "golines" },
      },
    },
  },

  haskell = {
    treesitter = { "haskell" },
    lsp = { { name = "hls", mason = false } },
  },

  java = {
    treesitter = { "java", "kotlin" },
  },

  misc = {
    treesitter = {
      "latex",
      "query",
      "terraform",
      "yuck",
      "bash",
      "fish",
      "norg",
    },

    lsp = { { name = "sqlls" } },

    conform = {
      formatters_by_ft = {
        markdown = { "prettierd" },
      },
    },
  },

  php = {
    treesitter = { "twig", "php" },

    lsp = {
      {
        name = "phpactor",
        mason = false,
        setup = {
          init_options = {
            ["language_server_phpstan.enabled"] = true,
            ["language_server_psalm.enabled"] = true,
          },
        },
      },
    },

    conform = {
      formatters_by_ft = {
        php = { "php" },
      },

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

  python = {
    treesitter = { "python" },
    lsp = {
      { name = "basedpyright", mason = false },
      {
        name = "ruff",
        mason = false,
        setup = {
          cmd = { "ruff", "server", "--preview" },
        },
      },
    },

    conform = {
      formatters_by_ft = {
        python = { "black", "isort" },
      },

      formatters = {
        isort = {
          cwd = function()
            vim.fn.getcwd()
          end,
          prepend_args = { "--profile=black" },
        },

        black = {
          cwd = function()
            vim.fn.getcwd()
          end,

          prepend_args = { "--line-length", "100" },
        },
      },
    },
  },

  rust = {
    treesitter = { "rust" },

    lsp = {
      {
        name = "rust_analyzer",
        lsp_config = false,
        mason = false,
      },
    },
  },

  web = {
    treesitter = {
      "css",
      "html",
      "javascript",
      "scss",
      "svelte",
      "tsx",
      "typescript",
    },

    lsp = {
      {
        name = "cssls",
      },
      {
        name = "svelte",
      },
      {
        name = "ts_ls",
        mason = false,
      },
    },

    conform = {
      formatters_by_ft = {
        javascript = { "prettierd" },
      },
    },

    linters = {
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
    },
  },
}

local default_module = {
  treesitter = {},
  lsp = {},
  conform = {},
  linters = {},
}

local default_lsp = {
  name = nil,
  lsp_config = true,
  mason = true,
  setup = {},
}

local lsp_config = {}

local M = {
  treesitter = {},
  mason_include = {},
  mason_exclude = {},
  conform = {}, -- formatting
  linters = {},
}

for _, module_conf in pairs(packages) do
  if module_conf.setup then
    module_conf.setup()
  end

  local module = utils.table_merge_copy(default_module, module_conf)

  for _, ts in pairs(module.treesitter) do
    table.insert(M.treesitter, ts)
  end

  for _, lsp_conf in pairs(module.lsp) do
    local lsp = utils.table_merge_copy(default_lsp, lsp_conf)

    if lsp.mason then
      table.insert(M.mason_include, lsp.name)
    else
      table.insert(M.mason_exclude, lsp.name)
    end

    if lsp.lsp_config then
      lsp_config[lsp.name] = lsp.setup
    end
  end

  utils.table_merge(M.conform, module.conform)
  utils.table_merge(M.linters, module.linters)
end

function M.setup_lsp()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  for name, setup in pairs(lsp_config) do
    setup.capabilities = capabilities
    lspconfig[name].setup(setup)
  end
end

return M
