require "user.plugins"
require("nvim-tree").setup() -- Should be setup elsewhere?

require "user.notify"

require "user.options"
require "user.colorscheme"
require "user.telescope"
require "user.completion"
require "user.buffers"
require "user.lsp"
require "user.tree"
require "user.git"
require "user.terminal"
-- require "user.treesitter"
require "user.which-key"
require "user.lualine"
require "user.start"
require("user.languages.init").setup()

-- After loading plugins
require "user.keymaps"
