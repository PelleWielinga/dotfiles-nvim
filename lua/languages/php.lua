local M = {}

M.treesitter = {
  "twig",
  "php",
}

M.lsp = {
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
}

return M
