require "user.plugins"
require("nvim-tree").setup() -- Should be setup elsewhere?

require "user.options"
require "user.colorscheme"
require "user.telescope"
require "user.completion"

-- After loading plugins
require "user.keymaps"

