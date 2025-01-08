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
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.neovim
              pkgs.ripgrep
              pkgs.fzf

              pkgs.nil
            ];

            shellHook = ''
              export NVIM_RUNTIME_PATH="$HOME/.config/nvim"
            '';
          };

          packages.default = pkgs.neovim;

          apps.default = {
            type = "app";
            program = "${pkgs.neovim}/bin/nvim";
          };
        };
    };
}
