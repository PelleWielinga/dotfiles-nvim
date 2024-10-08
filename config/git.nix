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
      action = "<cmd>LazyGit<cr>";
      key = "<leader>gl";
      options.desc = "LazyGit";
    }
    {
      action = "<cmd>Neogit<cr>";
      key = "<leader>gn";
      options.desc = "Neogit";
    }
    {
      action = "<cmd>DiffviewOpen<cr>";
      key = "<leader>gv";
      options.desc = "Diffview open";
    }
    {
      action = "<cmd>DiffviewFileHistory %<cr>";
      key = "<leader>gh";
      options.desc = "Diffview open";
    }
    {
      action = "<cmd>DiffviewClose<cr>";
      key = "<leader>gq";
      options.desc = "Diffview close";
    }
  ];

  plugins = {
    diffview.enable = true;
    gitsigns.enable = true;
    lazygit.enable = true;
    neogit.enable = true;
  };
}
