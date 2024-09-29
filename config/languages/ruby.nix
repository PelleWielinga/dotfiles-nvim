{ lib, pkgs, ... }:
{
  plugins = {
    lsp.servers.ruby-lsp.enable = true;
    # conform-nvim.settings = {
    #   formatters_by_ft.nix = [ "nixfmt" ];
    #   formatters.nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
    # };
  };
}
