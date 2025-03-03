return {
  {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "<leader>pf", "<cmd>Oil<cr>", desc = "Oil current directory" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      }
    },
  },
}
