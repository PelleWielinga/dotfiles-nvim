{ lib, pkgs, ... }:
{
  plugins = {
    conform-nvim.settings = {
      formatters_by_ft.markdown = [ "prettierd" ];
      formatters = {
        prettierd.command = lib.getExe pkgs.prettierd;
      };
    };
  };
}
