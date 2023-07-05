local function find_files()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--hidden", "-g", "!.git" }
  })
end

local function find_all_files()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--hidden", "-g", "!.git", "--no-ignore" }
  })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    keys = {
      { "<leader>fa", find_all_files,                                           desc = "Find files including gitignore" },
      { "<leader>ff", find_files,                                               desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Grep" },
      { "<leader>fs", function() require("telescope.builtin").git_status() end, desc = "Changed files" },
    },
    dependencies = {
      "folke/which-key.nvim",
    },
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    lazy = true,
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
    "cljoly/telescope-repo.nvim",
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>fp", "cmd>Telescope repo list", desc = "Find projects" }
    },
    config = function()
      local telescope = require('telescope')

      telescope.setup {
        extensions = {
          repo = {
            list = {
              cwd = "~/dev",
              search_dirs = { "~/dev" },
            },
          },
        },
      }

      telescope.load_extension('repo')
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true,
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
