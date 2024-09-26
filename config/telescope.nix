{ pkgs, ... }:
{
  extraPlugins = [

    (pkgs.vimPlugins.sqlite-lua.overrideAttrs (oldAttrs: {
      postPatch = ''
        substituteInPlace lua/sqlite/defs.lua \
          --replace-fail "path = vim.g.sqlite_clib_path" 'path = vim.g.sqlite_clib_path or "${pkgs.sqlite.out}/lib/libsqlite3.so"'
      '';
    }))

    (pkgs.vimUtils.buildVimPlugin {
      name = "smart_open";
      src = pkgs.fetchFromGitHub {
        owner = "danielfalk";
        repo = "smart-open.nvim";
        rev = "f4e39e9a1b05a6b82b1182a013677acc44b27abb";
        hash = "sha256-bEo5p7tHeoE13P8QsjC8RqNA0NMogjdYzN0oatQaIJY=";
      };
    })
  ];

  plugins = {
    telescope = {
      enable = true;
      enabledExtensions = [
        "smart_open"
      ];
      extensions = {
        ui-select.enable = true;
        frecency.enable = true;
        manix.enable = true;
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Telescope files";
          };
        };
        "<leader>fr" = {
          action = ''frecency workspace=CWD'';
          options = {
            desc = "Telescope frecency";
          };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Telescope grep";
          };
        };
        "<leader>fm" = {
          action = "manix";
          options = {
            desc = "Telescope manix";
          };
        };
        "<leader>fo" = {
          action = "smart_open cwd_only=true";
          options = {
            desc = "Telescope smart open";
          };
        };
        "gr" = {
          action = ''lsp_references'';
          options.desc = "Find references";
        };
      };
    };
  };
}
