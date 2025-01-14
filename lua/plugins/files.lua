return {
  {
    "rgroli/other.nvim",
    keys = {
      { "gs", "<cmd>Other<cr>", desc = "Switch to other" },
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
        {
          pattern = "/lua/(.*)/(.*).lua",
          target = "/spec/%1/%2_spec.lua",
          context = "test",
        },
        {
          pattern = "/spec/(.*)/(.*)_spec.lua",
          target = "/lua/%1/%2.lua",
          context = "source",
        },
        {
          pattern = "/(.*)/(.*).py",
          target = "/tests/%1/test_%2.py",
          context = "test",
        },
        {
          pattern = "/tests/(.*)/test_(.*).py",
          target = "/%1/%2.py",
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
      { "<leader>ha", "<cmd>Grapple toggle<cr>",         desc = "Tag a file" },
      { "<leader>hh", "<cmd>Grapple toggle_tags<cr>",    desc = "Toggle tags menu" },

      { "<leader>1",  "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
      { "<leader>2",  "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
      { "<leader>3",  "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
      { "<leader>4",  "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
      { "<leader>5",  "<cmd>Grapple select index=5<cr>", desc = "Select fifth tag" },

      { "<C-Home>",   "<cmd>Grapple cycle backward<cr>", desc = "Go to previous tag" },
      { "<C-End>",    "<cmd>Grapple cycle forward<cr>",  desc = "Go to next tag" },
    },
  },
}
