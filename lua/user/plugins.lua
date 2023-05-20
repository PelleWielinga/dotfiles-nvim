local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local filename = "*/lua/user/test.lua"
vim.cmd([[
  augroup packer_user_config
    autocmd BufWritePost ]] .. filename .. [[ source <afile>
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
})

local function load_plugins(use, module)
  package.loaded[module] = nil

  local package_load_ok, loaded_package = pcall(require, module)
  if not package_load_ok then
    vim.notify("Failed to load package " .. module, vim.log.levels.ERROR)
    return
  end

  if not (type(loaded_package) == "table") or not (type(loaded_package.setup) == "function") then
    vim.notify("Package " .. module .. " does not return a setup function", vim.log.levels.ERROR)
    return
  end

  local package_setup_ok, _ = pcall(loaded_package.setup, use)
  if not package_setup_ok then
    vim.notify("Package " .. module .. " has an error in the setup function", vim.log.levels.ERROR)
    return
  end
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself

  local plenary = "nvim-lua/plenary.nvim"
  local treesitter = "nvim-treesitter/nvim-treesitter"
  local which_key = "folke/which-key.nvim"
  local devicons = "nvim-tree/nvim-web-devicons"

  use({
    treesitter,
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "java", "kotlin", "twig", "rust" },
      })
    end,
  })

  use({ plenary })
  use({ which_key })

  use("nvim-lua/popup.nvim")

  -- Handles adding closing brackets
  use("rstacruz/vim-closer")

  load_plugins(use, "user.mason")

  use({
    -- Several error reporting improvements
    "folke/trouble.nvim",
    requires = { devicons, which_key },
    config = function()
      require("trouble").setup({})
      local wk = require("which-key")

      wk.register({
        t = { "<cmd>Trouble<cr>", "Open Trouble window" },
      }, { prefix = "<leader>d" })
    end,
  })

  -- Tests
  use({
    "nvim-neotest/neotest",
    requires = {
      plenary,
      treesitter,
      which_key,
      "rouge8/neotest-rust",
    },
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
  })

  -- Code completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")

  -- Code snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- Tree
  use("nvim-tree/nvim-tree.lua")

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-media-files.nvim")
  use("cljoly/telescope-repo.nvim")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- Terminal
  use("akinsho/toggleterm.nvim")

  -- Random stuff
  use({
    "akinsho/bufferline.nvim",
    requires = { "moll/vim-bbye" },
    config = function()
      require("bufferline").setup {
        options = {
          offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        },
      }
    end
  })

  use("rktjmp/lush.nvim")
  use("briones-gabriel/darcula-solid.nvim")
  use("folke/tokyonight.nvim")

  use("nvim-lualine/lualine.nvim")
  use("startup-nvim/startup.nvim")
  use("rcarriga/nvim-notify")
  use("ap/vim-css-color")

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
