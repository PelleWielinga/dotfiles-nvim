return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fa",
        function()
          require("telescope.builtin").find_files({
            find_command = { "rg", "--files", "--hidden", "-g", "!.git", "--no-ignore" },
          })
        end,
        desc = "Find files including gitignore",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          })
        end,
        desc = "Find files",
      },
      {
        "<leader>fs",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "Changed files",
      },
      {
        "<leader>fo",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols()
        end,
        desc = "Symbols",
      },
      {
        "<leader>fk",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols({
            symbols = {
              "class",
              "struct",
              "interface",
              "enum",
            },
          })
        end,
        desc = "Classes",
      },

      {
        "<leader>fn",
        "<cmd>Telescope notify<cr>",
        "Telescope notify",
      },
      {
        "gr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = "Find references",
      },
      {
        "<leader>fp",
        function()
          require("lib.project_picker").projects()
        end,
        desc = "Find projects",
      },
    },
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    keys = {
      { "<leader>fm", "<cmd>Telescope media_files<cr>", desc = "Find media files" },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          media_files = {
            filetypes = { "png", "jpg" },
          },
        },
      })

      telescope.load_extension("media_files")
    end,
  },

  {
    "camgraff/telescope-tmux.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>ft", "<cmd>Telescope tmux sessions<cr>", desc = "Telescope sessions" },
    },
    config = function()
      require("telescope").load_extension("tmux")
    end,
  },

  {
    "FeiyouG/commander.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>fc",
        function()
          require("commander").show()
        end,
        desc = "Telescope commands",
      },
    },
    opts = {
      integration = {
        lazy = {
          enable = true,
        },
      },
    },
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      telescope.load_extension("ui-select")
    end,
  },
}
