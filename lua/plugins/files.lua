return {
  {
    'echasnovski/mini.files',
    keys = {
      {
        "<A-`>",
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), false)
        end,
        desc = "File browser"
      }
    },
    opts = {
      use_as_default_explorer = false,
      mappings = {
        go_in = '',
        go_in_plus = 'l'
      }
    },
  },

  {
    'rgroli/other.nvim',
    keys = {
      { "go", "<cmd>Other<cr>", desc = "Goto other" }
    },
    opts = {
      mappings = {
        {
          pattern = "/src/(.*)/(.*).clj",
          target = "/test/%1/%2_test.clj",
          context = "test"
        },
        {
          pattern = "/test/(.*)/(.*)_test.clj",
          target = "/src/%1/%2.clj",
          context = "source"
        },
        {
          pattern = "/src/(.*)/(.*).php",
          target = "/tests/%1/%2Test.php",
          context = "test"
        },
        {
          pattern = "/tests/(.*)/(.*)Test.php",
          target = "/src/%1/%2.php",
          context = "source"
        },
        "golang",
      }
    },
    config = function(_, opts)
      require("other-nvim").setup(opts)
    end
  }
}
