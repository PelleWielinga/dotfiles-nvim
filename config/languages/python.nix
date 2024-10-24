{
  plugins = {
    lsp.servers = {
      pylsp = {
        enable = false;
        settings.plugins = {
          rope.enabled = true;
          rope_autoimport.enabled = true;
          pylsp_mypy.enabled = true;
          ruff.enabled = true;
          isort.enabled = true;
        };
      };

      basedpyright.enable = true;
      ruff.enable = true;
    };

    neotest.adapters.python = {
      enable = true;
      settings = {
        args = [
          "-vv"
        ];
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
