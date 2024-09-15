{ lib, pkgs, ... }:
{
  plugins = {
    lsp.servers.gopls.enable = true;
    conform-nvim.settings = {
      formatters_by_ft.go = [ "gofumpt" ];
      formatters.gofumpt.command = lib.getExe pkgs.gofumpt;
    };
  };
}
