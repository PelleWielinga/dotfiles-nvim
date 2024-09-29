{ pkgs, ... }:
{
  imports = [
    ./keys.nix

    ./cmp.nix
    # ./copilot.nix
    ./flash.nix
    ./git.nix
    ./languages/go.nix
    ./languages/lua.nix
    ./languages/misc.nix
    ./languages/nix.nix
    ./languages/php.nix
    ./languages/python.nix
    ./neotest.nix
    ./obsidian.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  colorschemes.kanagawa = {
    enable = true;
    settings = {
      background = {
        dark = "wave";
        light = "lotus";
      };
    };
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    wrap = false;
    conceallevel = 2;

    number = true;
    relativenumber = true;
    cursorline = true;
    scrolloff = 10;

    expandtab = true;
    tabstop = 4;
    shiftwidth = 4;

    swapfile = false;
    autoread = true;

    clipboard = "unnamedplus";

    # Maximum number of items to show in a popup menu. Useful for limiting 
    # options in autocompletion.
    pumheight = 10;

    termguicolors = true;
    timeout = true;
    timeoutlen = 300;
  };

  extraPlugins = [
    pkgs.vimPlugins.nvim-surround
  ];

  extraConfigLua = # lua
    ''
      require("nvim-surround").setup({})
      luasnip = require("luasnip")
    '';

  plugins = {
    auto-save.enable = true;
    comment.enable = true;
    conform-nvim.enable = true;
    fidget.enable = true;
    lsp.enable = true;
    nvim-autopairs.enable = true;
    todo-comments.enable = true;
    treesitter-context.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;

    illuminate = {
      enable = true;
      minCountToHighlight = 2;
      underCursor = false;
      filetypesDenylist = [
        "markdown"
      ];
    };

    mini = {
      enable = true;
      modules.files = {
        mappings = {
          go_in = "";
          go_in_plus = "<Right>";
          go_out = "<Left>";
        };
      };
    };

    lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = true;
        };
        sections = {
          lualine_c = [
            {
              __unkeyed-1 = "filename";
              path = 1;
            }
          ];
        };
      };
    };
  };
}
