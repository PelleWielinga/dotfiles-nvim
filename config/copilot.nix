let
  lua = str: "<cmd>lua " + str + "<cr>";
in
{
  keymaps = [
    {
      action = lua ''require("copilot.suggestion").next()'';
      key = "<C-Space>";
      mode = [ "i" ];
      options.desc = "Copilot next";
    }
    {
      action = lua ''require("copilot.suggestion").accept()'';
      key = "<C-n>";
      mode = [ "i" ];
      options.desc = "Copilot accept";
    }
    {
      action = lua ''require("copilot.suggestion").accept_word()'';
      key = "<C-i>";
      mode = [ "i" ];
      options.desc = "Copilot accept word";
    }
    {
      action = lua ''require("copilot.suggestion").accept_line()'';
      key = "<C-e>";
      mode = [ "i" ];
      options.desc = "Copilot accept line";
    }
  ];

  plugins = {
    copilot-lua = {
      enable = true;
      suggestion.autoTrigger = true;
    };
  };
}
