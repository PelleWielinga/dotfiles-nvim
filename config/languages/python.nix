{
  plugins = {
    lsp.servers = {
      basedpyright.enable = true;
      ruff.enable = true;
    };
  };
}

# python = {
#   treesitter = { "python" },
#   lsp = {
#     { name = "basedpyright", mason = false },
#     {
#       name = "ruff",
#       mason = false,
#       setup = {
#         cmd = { "ruff", "server", "--preview" },
#       },
#     },
#   },
#
#   conform = {
#     formatters_by_ft = {
#       python = { "black", "isort" },
#     },
#
#     formatters = {
#       isort = {
#         cwd = function()
#           vim.fn.getcwd()
#         end,
#         prepend_args = { "--profile=black" },
#       },
#
#       black = {
#         cwd = function()
#           vim.fn.getcwd()
#         end,
#
#         prepend_args = { "--line-length", "100" },
#       },
#     },
#   },
# },
