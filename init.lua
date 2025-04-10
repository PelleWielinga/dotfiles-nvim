vim.opt.rtp:prepend(os.getenv("NVIM_RUNTIME_PATH"))

require("config.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = {
    colorscheme = { "kanagawa-dragon" },
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  defaults = {
    lazy = true,
  },
  ui = {
    border = "rounded",
  },
  debug = false,
})
