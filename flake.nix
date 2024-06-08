{
  description = "Neovim config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
          rocks = pkgs.lua51Packages;
        in
        {
          default = pkgs.mkShell {
            buildInputs = [
              rocks.luafilesystem
              rocks.busted
              rocks.luacheck
            ];
          };
        }
      );
    };
}
