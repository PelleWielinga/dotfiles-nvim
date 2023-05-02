local user = require "user.lib.helpers"

local toggleterm = require('toggleterm')
local Terminal = require('toggleterm.terminal').Terminal

toggleterm.setup {
  direction = 'float',
}

local function simple_command(key, cmd)
  local term = Terminal:new({
    cmd = cmd,
    hidden = true,
  })

  local function toggle()
    term:toggle()
  end

  user.bind_key('n', key, toggle)
end

user.bind_key('n', '<C-\\>', ":ToggleTerm<CR>")
user.bind_key('i', '<C-\\>', "<Esc>:ToggleTerm<CR>")
user.bind_key('t', '<C-\\>', "<cmd>close<CR>")

simple_command(',eg', 'lazygit')
simple_command(',ec', 'cmatrix')

-- TODO: Make these commands specific to the type of project.
simple_command(',en', 'npm i ; read -P ""')
simple_command(',eh', 'home-manager switch --flake /home/pelle/dev/space/home/nixos ; read -P ""')
