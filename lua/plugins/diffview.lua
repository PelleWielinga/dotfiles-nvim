return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = {
      {
        "<leader>gv",
        "<cmd>DiffviewOpen<cr>",
        desc = "Diffview open",
      },
      {
        "<leader>gq",
        "<cmd>DiffviewClose<cr>",
        desc = "Diffview close",
      },
    },
  },
}
