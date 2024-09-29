return {
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics open focus=true<cr>", desc = "Trouble diagnostics" },
      { "<leader>xc", "<cmd>Trouble symbols open focus=true<cr>", desc = "Trouble symbols" },
      { "<leader>xr", "<cmd>Trouble lsp open focus=true<cr>", desc = "Trouble lsp" },
    },
    config = function()
      require("trouble").setup({
        auto_close = true,
      })

      local open_with_trouble = require("trouble.sources.telescope").open
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
          },
        },
      })
    end,
  },
}
