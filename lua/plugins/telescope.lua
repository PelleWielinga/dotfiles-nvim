return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fa",
        function()
          require("telescope.builtin").find_files({
            find_command = { "rg", "--files", "--hidden", "-g", "!.git", "--no-ignore" }
          })
        end,
        desc = "Find files including gitignore"
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" }
          })
        end,
        desc = "Find files"
      },
      {
        "<leader>fg",
        function() require("telescope.builtin").live_grep() end,
        desc = "Grep"
      },
      {
        "<leader>fs",
        function() require("telescope.builtin").git_status() end,
        desc = "Changed files"
      },
    },
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    keys = {
      { "<leader>fm", "<cmd>Telescope media_files<cr>", desc = "Find media files", }
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local telescope = require('telescope')

      telescope.setup {
        extensions = {
          media_files = {
            filetypes = { "png", "jpg" },
          },
        },
      }

      telescope.load_extension('media_files')
    end
  },

  {
    "camgraff/telescope-tmux.nvim",
    keys = {
      { "<leader>ft", "<cmd>Telescope tmux sessions<cr>", "Telescope sessions" },
    },
    config = function()
      require('telescope').load_extension("tmux")
    end
  },

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<cr>", "Telescope projects" }
    },
    config = function()
      require('project_nvim').setup {
        silent_chdir = false,
        detection_methods = { "pattern " },
        exclude_dirs = { "~/.config/*" }
      }

      require('telescope').load_extension('projects')
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    -- TODO: Can this be triggered on sime kind of event instead of at VeryLazy?
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local telescope = require('telescope')

      telescope.setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        },
      }

      telescope.load_extension("ui-select")
    end
  },
}
