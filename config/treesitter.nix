{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
      };
    };

    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
        };
      };
    };
  };
}
