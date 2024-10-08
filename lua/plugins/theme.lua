return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>pd",
        function()
          require("notify").dismiss()
        end,
        desc = "Dismiss notifications",
      },
    },
    config = function()
      vim.notify = require("notify")
      vim.notify.setup({
        render = "default",
        stages = "static",
        top_down = false,
      })
    end,
  },
}
