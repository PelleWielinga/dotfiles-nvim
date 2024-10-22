{ lib, pkgs, ... }:
{
  plugins = {
    lsp.servers = {
      ts_ls.enable = true;
      cssls.enable = true;
    };

    conform-nvim.settings = {
      formatters_by_ft.javascript = [ "prettierd" ];
      formatters_by_ft.typescript = [ "prettierd" ];
      formatters.prettierd.command = lib.getExe pkgs.prettierd;
    };
  };
}
