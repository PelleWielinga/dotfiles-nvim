-- Autosave buffers
return {
  {
    "willothy/savior.nvim",
    dependencies = { "j-hui/fidget.nvim" },
    event = "VeryLazy",
    config = function()
      local savior = require("savior")
      savior.setup({
        conditions = {
          savior.conditions.is_file_buf,
          savior.conditions.not_of_filetype({
            "gitcommit",
            "gitrebase",
          }),
          savior.conditions.is_named,

          -- Excluded from the default config:
          -- savior.conditions.file_exists,
          -- savior.conditions.has_no_errors,
        },
        notify = true,
      })
    end,
  },
}
