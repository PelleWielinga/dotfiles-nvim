let
  lua = str: "<cmd>lua " + str + "<cr>";
in
{
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

    # Split movement
    {
      key = "<C-Down>";
      action = "<cmd>wincmd j<cr>";
      options.desc = "Focus split below";
      mode = [
        "i"
        "n"
        "t"
      ];
    }
    {
      key = "<C-Left>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Focus split to the left";
      mode = [
        "i"
        "n"
        "t"
      ];
    }
    {
      key = "<C-Right>";
      action = "<cmd>wincmd l<cr>";
      options.desc = "Focus split to the right";
      mode = [
        "i"
        "n"
        "t"
      ];
    }
    {
      key = "<C-Up>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Focus split above";
      mode = [
        "i"
        "n"
        "t"
      ];
    }

    {
      key = "<C-j>";
      action = "<cmd>wincmd j<cr>";
      options.desc = "Focus split below";
      mode = [
        "i"
        "n"
        "t"
      ];
    }
    {
      key = "<C-h>";
      action = "<cmd>wincmd h<cr>";
      options.desc = "Focus split to the left";
      mode = [
        "i"
        "n"
        "t"
      ];
    }
    {
      key = "<C-l>";
      action = "<cmd>wincmd l<cr>";
      options.desc = "Focus split to the right";
      mode = [
        "i"
        "n"
        "t"
      ];
    }
    {
      key = "<C-k>";
      action = "<cmd>wincmd k<cr>";
      options.desc = "Focus split above";
      mode = [
        "i"
        "n"
        "t"
      ];
    }
  ];
}
