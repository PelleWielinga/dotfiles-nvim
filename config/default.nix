{ pkgs, ... }:
{
  imports = [
    ./languages/nix.nix
    ./languages/lua.nix
    ./languages/python.nix
    ./cmp.nix
    ./flash.nix
    ./git.nix
    ./obsidian.nix
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
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
      key = "<leader>a";
      options = {
        desc = "Code actions";
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
    {
      action = # lua
        ''
          :lua require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
        '';
      key = "<leader>pf";
      options = {
        desc = "File browser";
      };
    }
  ];

  extraPlugins = [
    pkgs.vimPlugins.nvim-surround
  ];

  extraConfigLua = # lua
    ''
      require("nvim-surround").setup({})
    '';

  plugins = {
    comment.enable = true;
    conform-nvim.enable = true;
    fidget.enable = true;
    illuminate.enable = true;
    lsp.enable = true;
    nvim-autopairs.enable = true;
    treesitter-context.enable = true;
    treesitter.enable = true;
    which-key.enable = true;

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
