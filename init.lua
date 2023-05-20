require "user.plugins"
require("nvim-tree").setup() -- Should be setup elsewhere?

require "user.notify"

require "user.options"
require "user.colorscheme"
require "user.telescope"
require "user.completion"
require "user.buffers"
require "user.tree"
require "user.git"
require "user.terminal"
require "user.which-key"
require "user.lualine"
require "user.start"

-- After loading plugins
require "user.keymaps"
