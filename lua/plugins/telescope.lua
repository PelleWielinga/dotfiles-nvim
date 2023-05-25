return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
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
          }
        },
      }

      telescope.load_extension('repo')
      telescope.load_extension('media_files')

      local function find_files()
        builtin.find_files({
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" }
        })
      end

      wk.register({
        name = "Find",
        p = { "<cmd>Telescope repo<CR>", "Find projects" },
        f = { find_files, "Find files" },
        g = { telescope.live_grep, "Grep" },
        s = { telescope.git_status, "Changed files" },
      }, { prefix = "<leader>f" })
    end
  },
}
