return {
  {
    "rcarriga/nvim-notify",
    priority = 1000,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.notify = require("notify")
    end
  },

  "rstacruz/vim-closer"
}
