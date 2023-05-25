return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()

      local tree = require('nvim-tree.api').tree
      local fns = require('utils')
      local wk = require("which-key")

      local function nvim_toggle_or_exit()
        fns.ensure_normal_mode()

        if tree.is_tree_buf() then
          tree.close()
        else
          tree.open({ find_file = true })
        end
      end

      wk.register({
        ["<A-`>"] = { nvim_toggle_or_exit, "Toggle file tree" }
      }, { mode = { "n", "i" } })
    end
  }
}
