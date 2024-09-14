let
  gitsigns = key: cmd: desc: {
    action = ''<cmd>lua require("gitsigns").'' + cmd + "()<cr>";
    key = "<leader>g" + key;
    options = {
      desc = desc;
    };
  };
in
{
  keymaps = [
    (gitsigns "r" "reset_hunk" "Reset hunk")
    (gitsigns "d" "diffthis" "Diff this")
    (gitsigns "p" "preview_hunk" "Preview hunk")
    (gitsigns "s" "stage_hunk" "Stage hunk")
    (gitsigns "u" "undo_stage_hunk" "Undo stage hunk")
    {
      action = "<cmd>Git<cr>";
      key = "<leader>gf";
      options.desc = "Git fugitive";
    }
    {
      action = "<cmd>Git blame<cr>";
      key = "<leader>gb";
      options.desc = "Git blame";
    }
    {
      action = "<cmd>LazyGit<cr>";
      key = "<leader>gl";
      options.desc = "LazyGit";
    }
  ];

  plugins = {
    fugitive.enable = true;
    gitsigns.enable = true;
    lazygit.enable = true;
  };
}
