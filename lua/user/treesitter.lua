require('vim-treesitter').setup {}

require('vim-treesitter.configs').setup {
  ensure_installed = { "java", "kotlin", "twig" }
}
