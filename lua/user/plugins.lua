local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Have packer manage itself

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Handles adding closing brackets
  use 'rstacruz/vim-closer'

  -- Syntax highlighting and LSP
  use 'nvim-treesitter/nvim-treesitter'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Tests
  use 'vim-test/vim-test'

  -- Code completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  -- Code snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Tree
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'ahmedkhalf/project.nvim'

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Terminal
  use 'akinsho/toggleterm.nvim'

  -- Random stuff
  use 'akinsho/bufferline.nvim'
  use 'moll/vim-bbye' -- Needed for bufferline?

  use 'rktjmp/lush.nvim'
  use 'briones-gabriel/darcula-solid.nvim'

  use 'folke/which-key.nvim'

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
