{ pkgs, ... }:
{
  plugins = {
    lsp.servers.rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      settings.rustfmt.enable = true;
    };

    neotest.adapters.rust.enable = true;
  };
}
