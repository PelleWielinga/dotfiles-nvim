return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- Nice start screen.
      dashboard = { enabled = true },

      input = { enabled = true },

      -- Basically an alternative to Telescope.
      picker = { enabled = true },

      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },

      -- Treesitter based indentation lines. Disabled to reduce visual clutter.
      indent = { enabled = false },

      -- Disable any scrolling animations. Slow and unnecessary.
      scroll = { enabled = false },

      zen = {
        win = {
          backdrop = {
            transparent = false,
            blend = 99,
          },
        },
      },
    },

    keys = {
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },

      {
        "<leader>fb",
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Picker diagnostics in buffer",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Picker changed files",
      },
      {
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Picker diagnostics",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Picker grep",
      },
      {
        "<leader>fh",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Picker previous commands",
      },
      {
        "<leader>fn",
        function()
          Snacks.picker.notifier.show_history()
        end,
        desc = "Picker notifications",
      },
      {
        "<leader>fo",
        function()
          Snacks.picker.files({ hidden = true })
        end,
        desc = "Picker open file",
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "Picker symbols in file",
      },
      {
        "<leader>fv",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "Picker colorschemes",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.lsp_workspace_symbols({
            filter = {
              default = {
                "Class",
                "Struct",
                "Interface",
                "Enum",
              },
            },
          })
        end,
        desc = "Picker symbols in workspace",
      },

      {
        "<leader>gl",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gh",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit history",
      },
      {
        "<leader>gc",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazygit commits",
      },

      {
        "gr",
        function()
          Snacks.picker.lsp_references()
        end,
        desc = "Goto references",
      },
      {
        "gD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "Goto declaration",
      },
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto definition",
      },
      {
        "gi",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto implementation",
      },
    },
  },
}
