return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
