{ pkgs, ... }:
let
  lua = str: "<cmd>lua " + str + "<cr>";
in
{
  imports = [
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
    ./treesitter.nix
    ./telescope.nix
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
        silent = true;
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
        silent = true;
      };
    }
    {
      action = lua "vim.lsp.buf.declaration()";
      key = "gD";
      options.desc = "Goto declaration";
    }
    {
      action = lua "vim.lsp.buf.definition()";
      key = "gd";
      options.desc = "Goto definition";
    }
    {
      action = lua "vim.lsp.buf.implementation()";
      key = "gi";
      options.desc = "Goto implementation";
    }
    {
      action = lua "vim.diagnostic.open_float()";
      key = "gl";
      options.desc = "Open diagnostic float";
    }
    {
      key = "[:";
      action = lua "vim.diagnostic.goto_prev()";
      options.desc = "Previous diagnostic";
    }
    {
      key = "[d";
      action = lua "vim.diagnostic.goto_prev()";
      options.desc = "Previous diagnostic";
    }
    {
      key = "]:";
      action = lua "vim.diagnostic.goto_next()";
      options.desc = "Next diagnostic";
    }
    {
      key = "]d";
      action = lua "vim.diagnostic.goto_next()";
      options.desc = "Next diagnostic";
    }
    {
      key = "<";
      action = "<gv";
      options.desc = "Shift left";
      mode = "v";
    }
    {
      key = ">";
      action = ">gv";
      options.desc = "Shift right";
      mode = "v";
    }
    {
      key = "<leader>rr";
      action = lua "vim.lsp.buf.rename()";
      options.desc = "Rename variable";
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
    auto-save.enable = true;
    comment.enable = true;
    conform-nvim.enable = true;
    fidget.enable = true;
    lsp.enable = true;
    nvim-autopairs.enable = true;
    treesitter-context.enable = true;
    which-key.enable = true;
    web-devicons.enable = true;

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
