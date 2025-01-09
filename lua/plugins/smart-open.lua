return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    keys = {
      {
        "<leader>fo",
        function()
          require("telescope").extensions.smart_open.smart_open({
            cwd_only = true,
          })
        end,
        desc = "Telescope smart open",
      },
    },
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
}
