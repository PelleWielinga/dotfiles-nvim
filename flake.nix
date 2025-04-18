{
  description = "Neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { flake-parts, self, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        {
          pkgs,
          system,
          lib,
          ...
        }:
        let
          libsqlite = "${pkgs.sqlite.out}/lib/libsqlite3${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}";
          lua = pkgs.lua51Packages;
          node = pkgs.nodePackages_latest;

          luaPackages = [
            pkgs.lua51Packages.luafilesystem
          ];

          buildInputs = [
            pkgs.ripgrep
            pkgs.fzf
            pkgs.gnumake

            # SQL
            pkgs.sqlite
            pkgs.sqls

            pkgs.nil
            pkgs.lua-language-server
            pkgs.nixfmt-rfc-style

            # Python
            pkgs.python3
            pkgs.ruff
            pkgs.basedpyright

            # JS/TS
            node.nodejs
            node.prettier
            pkgs.eslint

            # Development tools
            pkgs.lefthook
            pkgs.stylua

            lua.luafilesystem
          ] ++ luaPackages;

          luaPath =
            lib.concatStringsSep ";" (
              [ "${self}/lua/?.lua" ] ++ (map (pkg: "${pkg}/share/lua/5.1/?.lua") luaPackages)
            )
            + ";;;";
          luaCPath = lib.concatStringsSep ";" (map (pkg: "${pkg}/lib/lua/5.1/?.so") luaPackages) + ";;";

          dynamicPath = lib.concatStringsSep ":" (map (pkg: "${pkg}/bin") buildInputs);
        in
        {
          devShells.default = pkgs.mkShell {
            inherit buildInputs;

            shellHook = ''
              export NVIM_RUNTIME_PATH="$HOME/.config/nvim"
              export LIBSQLITE=${libsqlite}
            '';
          };

          packages.default = pkgs.writeShellScriptBin "nvim" ''
            #!/bin/sh

            export VIMINIT="source ${self}/init.lua"
            export NVIM_RUNTIME_PATH="${self}"
            export LIBSQLITE=${libsqlite}
            export PATH="${dynamicPath}:$PATH"
            export LUA_PATH="${luaPath}"
            export LUA_CPATH="${luaCPath}"

            exec ${pkgs.neovim}/bin/nvim "$@"
          '';
        };
    };
}
