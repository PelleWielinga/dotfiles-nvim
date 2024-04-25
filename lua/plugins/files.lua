return {
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>pf",
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
      -- TODO: Find another keybinding to use.
      -- { "go", "<cmd>Other<cr>", desc = "Goto other" },
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
    "cbochs/grapple.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    keys = {
      { "<leader>ha", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
      { "<leader>hh", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
      { "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Select fifth tag" },

      { "<C-Home>", "<cmd>Grapple cycle backward<cr>", desc = "Go to previous tag" },
      { "<C-End>", "<cmd>Grapple cycle forward<cr>", desc = "Go to next tag" },
    },
  },
}
