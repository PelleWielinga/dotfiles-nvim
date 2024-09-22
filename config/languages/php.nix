{
  plugins = {
    lsp.servers.phpactor = {
      enable = true;
    };
  };
}

# php = {
#   lsp = {
#     {
#       name = "phpactor",
#       mason = false,
#       setup = {
#         init_options = {
#           ["language_server_phpstan.enabled"] = true,
#           ["language_server_psalm.enabled"] = true,
#         },
#       },
#     },
#   },
#
#   conform = {
#     formatters_by_ft = {
#       php = { "php" },
#     },
#
#     formatters = {
#       php = {
#         command = "./vendor/bin/php-cs-fixer",
#         args = {
#           "fix",
#           "$FILENAME",
#         },
#         stdin = false,
#       },
#     },
#   },
# },
