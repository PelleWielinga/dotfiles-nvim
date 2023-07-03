return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "cljoly/telescope-repo.nvim"
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require("telescope.builtin")
      local wk = require("which-key")

      telescope.setup {
        extensions = {
          repo = {
            list = {
              cwd = "~/dev",
              search_dirs = { "~/dev" },
            },
          },
          media_files = {
            filetypes = { "png", "jpg" },
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        },
      }

      telescope.load_extension('repo')
      telescope.load_extension('media_files')
      telescope.load_extension("ui-select")

      local function find_files()
        builtin.find_files({
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" }
        })
      end

      local function find_all_files()
        builtin.find_files({
          find_command = { "rg", "--files", "--hidden", "-g", "!.git", "--no-ignore" }
        })
      end

      wk.register({
        name = "Find",
        p = { "<cmd>Telescope repo<CR>", "Find projects" },
        a = { find_all_files, "Find files including gitignore"},
        f = { find_files, "Find files" },
        g = { builtin.live_grep, "Grep" },
        s = { builtin.git_status, "Changed files" },
      }, { prefix = "<leader>f" })
    end
  },
}
