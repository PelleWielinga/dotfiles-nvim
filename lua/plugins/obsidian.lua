return {
  "epwalsh/obsidian.nvim",
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>nn",
      [[<cmd>ObsidianNew<cr>]],
      desc = "Search for note",
    },
    {
      "<leader>nt",
      [[<cmd>ObsidianToday<cr>]],
      desc = "Today's note",
    },
    {
      "<leader>ny",
      [[<cmd>ObsidianYesterday<cr>]],
      desc = "Yesterday's note",
    },
    {
      "<leader>nf",
      [[<cmd>ObsidianQuickSwitch<cr>]],
      desc = "Open note",
    },
    {
      "<leader>ns",
      [[<cmd>ObsidianSearch<cr>]],
      desc = "Search for note",
    },
    {
      "<leader>nb",
      [[<cmd>ObsidianBacklinks<cr>]],
      desc = "Backlinks",
    },
    {
      "<leader>nr",
      [[<cmd>ObsidianRename<cr>]],
      desc = "Rename",
    },
  },
  opts = {
    workspaces = {
      {
        name = "home",
        path = "~/dev/notes/home",
      },
      {
        name = "myTomorrows",
        path = "~/dev/notes/myTomorrows",
      },
    },
    daily_notes = {
      template = "Daily.md",
      folder = "journal/",
    },
    templates = {
      folder = "templates",
    },
  },
}
