{
  description = "Neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          libsqlite = "${pkgs.sqlite.out}/lib/libsqlite3${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}";
          lua = pkgs.lua51Packages;
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.neovim
              pkgs.ripgrep
              pkgs.fzf

              pkgs.sqlite

              pkgs.nil
              pkgs.lua-language-server

              # Python
              pkgs.python3
              pkgs.ruff
              pkgs.basedpyright

              # JS/TS
              pkgs.typescript-language-server

              lua.luafilesystem
            ];

            shellHook = ''
              export NVIM_RUNTIME_PATH="$HOME/.config/nvim"
              export LIBSQLITE=${libsqlite}
            '';
          };

          packages.default = pkgs.neovim;

          apps.default = {
            type = "app";
            program = "${pkgs.writeShellScriptBin "nvim-runtime" ''
              #!/bin/sh
              export NVIM_RUNTIME_PATH="$HOME/.config/nvim"
              export LIBSQLITE=${libsqlite}
              exec ${pkgs.neovim}/bin/nvim "$@"
            ''}/bin/nvim-runtime";
          };
        };
    };
}
