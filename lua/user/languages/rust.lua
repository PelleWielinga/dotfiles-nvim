local M = {}

M.packages = function(use)
  use "simrat39/rust-tools.nvim"
end

M.setup = function(use)
  local rt = require("rust-tools")
  rt.setup()
end

return M
