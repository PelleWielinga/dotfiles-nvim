{
  imports = [
    ./languages/nix.nix
    ./languages/lua.nix
  ];

  colorschemes.kanagawa = {
    enable = true;
    settings = {
      background = {
        dark = "dragon";
        light = "lotus";
      };
    };
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    neovide_scale_factor = 0.8;
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

  keymaps = [
    {
      action = "10j";
      key = "<C-d>";
      options = {
        desc = "Move down fast";
      };
    }
    {
      action = "10k";
      key = "<C-u>";
      options = {
        desc = "Move up fast";
      };
    }
    {
      action = "10j";
      key = "<PageDown>";
      options = {
        desc = "Move down fast";
      };
    }
    {
      action = "10k";
      key = "<PageUp>";
      options = {
        desc = "Move up fast";
      };
    }
    {
      action = # lua
        ''
          :lua require("conform").format({ async = true, lsp_fallback = true })
        '';
      key = "<leader>rf";
      options = {
        desc = "Conform format";
      };
    }
  ];

  plugins = {
    conform-nvim = {
      enable = true;
    };

    which-key = {
      enable = true;
    };

    lsp = {
      enable = true;
    };

    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Telescope files";
          };
        };

        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Telescope grep";
          };
        };
      };
    };
  };
}
