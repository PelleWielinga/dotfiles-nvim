let
  obsidian = key: cmd: desc: {
    action = "<cmd>Obsidian" + cmd + "<cr>";
    key = "<leader>n" + key;
    options = {
      desc = desc;
    };
  };
in
{
  keymaps = [
    (obsidian "n" "New" "Search for note")
    (obsidian "t" "Today" "Today's note")
    (obsidian "y" "Yesterday" "Yesterday's note")
    (obsidian "f" "QuickSwitch" "Open note")
    (obsidian "s" "Search" "Search for a note")
    (obsidian "b" "Backlinks" "Backlinks")
    (obsidian "r" "Rename" "Rename note")
    (obsidian "c" "NewFromTemplate" "Create from template")
  ];

  plugins = {
    obsidian = {
      enable = true;
      settings = {
        workspaces = [
          {
            name = "home";
            path = "~/dev/notes/home";
          }
          {
            name = "myTomorrows";
            path = "~/dev/notes/myTomorrows";
          }
        ];
        daily_notes = {
          template = "Daily.md";
          folder = "journal/";
        };
        templates = {
          folder = "templates";
        };
      };
    };
  };
}

# return {
#   "epwalsh/obsidian.nvim",
#   ft = "markdown",
#   dependencies = {
#     "nvim-lua/plenary.nvim",
#   },
#   opts = {
#     daily_notes = {
#       template = "Daily.md",
#       folder = "journal/",
#     },
#     templates = {
#       folder = "templates",
#     },
#     follow_url_func = function(url)
#       vim.ui.open(url)
#     end,
#   },
# }
