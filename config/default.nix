{
  colorschemes.kanagawa = {
    enable = true;
    settings = {
      background = {
        dark = "dragon";
        light = "lotus";
      };
    };
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
}
