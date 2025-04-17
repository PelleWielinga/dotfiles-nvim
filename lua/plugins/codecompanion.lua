return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
    },
  },
  keys = {
    {
      "<leader>cc",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanion Chat",
    },
    {
      "<leader>ca",
      "<cmd>CodeCompanionActions<cr>",
      desc = "CodeCompanion Actions",
    },
    {
      "<leader>cp",
      ":CodeCompanion <C-r>=input('Prompt: ')<CR><CR>",
      desc = "Run CodeCompanion prompt",
      mode = { "n", "x" },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
