local M = {}

M.treesitter = {
  "clojure",
}

M.lsp = {
  {
    name = "clojure_lsp",
    mason = false,
  }
}

M.plugins = {
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
}

return M
