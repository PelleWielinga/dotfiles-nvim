local user = require('user.lib.helpers')
local wk = require("which-key")
local toggleterm = require('toggleterm')
local Terminal = require('toggleterm.terminal').Terminal

toggleterm.setup {
  direction = 'float',
}

local function simple_command(key, cmd, name)
  local term = Terminal:new({
    cmd = cmd,
    hidden = true,
  })

  local function toggle()
    term:toggle()
  end

  wk.register({[key] = {toggle, name}}, {prefix = ",e"})
end

user.bind_key('n', '<C-\\>', ":ToggleTerm<CR>")
user.bind_key('i', '<C-\\>', "<Esc>:ToggleTerm<CR>")
user.bind_key('t', '<C-\\>', "<cmd>close<CR>")

wk.register({[",e"] = { name = "Execute" }})

simple_command('g', 'lazygit', "Lazygit")
simple_command('c', 'cmatrix', "CMatrix")

-- TODO: Make these commands specific to the type of project.
simple_command('n', 'npm i ; read -P ""', "npm install")
simple_command('h', 'home-manager switch --flake /home/pelle/dev/space/home/nixos ; read -P ""', "Nix home-manager")
