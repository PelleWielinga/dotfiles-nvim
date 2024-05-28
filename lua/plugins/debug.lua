return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle UI",
      },
    },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    event = "VeryLazy",
    config = function()
      require("dap-python").setup()
    end,
  },
}
