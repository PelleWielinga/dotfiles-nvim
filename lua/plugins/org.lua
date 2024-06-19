return {
  {
    "nvim-neorg/neorg",
    event = "VeryLazy",
    dependencies = { "vhyrro/luarocks.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.tempus"] = {},

          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
              neorg_leader = "<leader>n",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                work = "~/notes/work",
                home = "~/notes/home",
              },
            },
          },
        },
      })
    end,
  },
}
