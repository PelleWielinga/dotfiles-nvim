{ ... }:
let
  flash = str: ''<cmd>lua require("flash").'' + str + "()<cr>";
in
{
  keymaps = [
    {
      action = flash "jump";
      key = "s";
      mode = [
        "n"
        "o"
        "x"
      ];
      options = {
        desc = "Flash jump";
      };
    }
    {
      action = flash "treesitter";
      key = "S";
      mode = [
        "n"
        "o"
        "x"
      ];
      options = {
        desc = "Flash treesitter";
      };
    }
    {
      action = flash "remote";
      key = "r";
      mode = [ "o" ];
      options = {
        desc = "Flash remote";
      };
    }
    {
      action = flash "treesitter_search";
      key = "R";
      mode = [
        "o"
        "x"
      ];
      options = {
        desc = "Flash treesitter search";
      };
    }
    {
      action = flash "toggle";
      key = "<c-s>";
      mode = [ "c" ];
      options = {
        desc = "Flash flash search";
      };
    }
  ];

  plugins = {
    flash = {
      enable = true;
      settings = {
        modes.char.enabled = false;
      };
    };
  };
}
