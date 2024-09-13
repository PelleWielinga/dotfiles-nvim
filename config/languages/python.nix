{ lib, pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      basedpyright.enable = true;
      ruff.enable = true;
    };
    conform-nvim.settings = {
      formatters_by_ft.python = [
        "black"
        "isort"
      ];
      formatters = {
        black.command = lib.getExe pkgs.black;
        isort.command = lib.getExe pkgs.isort;
      };
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
