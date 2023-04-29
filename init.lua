require "user.plugins"
require("nvim-tree").setup() -- Should be setup elsewhere?

require "user.options"
require "user.colorscheme"
require "user.telescope"
require "user.completion"
require "user.buffers"
require "user.lsp"

-- After loading plugins
require "user.keymaps"

