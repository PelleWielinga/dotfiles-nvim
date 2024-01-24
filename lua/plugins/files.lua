return {
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<A-`>",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
        end,
        desc = "File browser",
      },
    },
    opts = {
      use_as_default_explorer = false,
      mappings = {
        go_in = "",
        go_in_plus = "l",
      },
    },
  },

  {
    -- TODO: How to make this work with different windows
    "rgroli/other.nvim",
    keys = {
      { "go", "<cmd>Other<cr>", desc = "Goto other" },
    },
    opts = {
      mappings = {
        {
          pattern = "/src/(.*)/(.*).clj",
          target = "/test/%1/%2_test.clj",
          context = "test",
        },
        {
          pattern = "/test/(.*)/(.*)_test.clj",
          target = "/src/%1/%2.clj",
          context = "source",
        },
        {
          pattern = "/src/(.*)/(.*).php",
          target = "/tests/%1/%2Test.php",
          context = "test",
        },
        {
          pattern = "/tests/(.*)/(.*)Test.php",
          target = "/src/%1/%2.php",
          context = "source",
        },
        "golang",
      },
    },
    config = function(_, opts)
      require("other-nvim").setup(opts)
    end,
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>hh",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        "Harpoon toggle",
      },
      {
        "<leader>hn",
        function()
          require("harpoon.ui").nav_next()
        end,
        "Harpoon toggle",
      },
      {
        "<leader>hp",
        function()
          require("harpoon.ui").nav_prev()
        end,
        "Harpoon toggle",
      },
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        "Harpoon toggle",
      },
    },
    opts = {},
  },
}
