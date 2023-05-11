local user = require('user.lib.helpers')
local wk = require("which-key")
local toggleterm = require('toggleterm')
local Terminal = require('toggleterm.terminal').Terminal

toggleterm.setup {
}

local function simple_command(key, cmd, name)
  local term = Terminal:new({
    cmd = cmd,
    hidden = true,
    direction = "float",
  })

  local function toggle()
    term:toggle()
  end

  wk.register({[key] = {toggle, name}}, {prefix = ",e"})
end

user.bind_key('n', '<C-\\>', "<cmd>ToggleTerm<CR>")
user.bind_key('i', '<C-\\>', "<cmd>ToggleTerm<CR>")
user.bind_key('t', '<C-\\>', "<cmd>ToggleTerm<CR>")

for i = 1,5 do
  user.bind_key('n', '<A-' .. i .. '>', "<cmd>ToggleTerm " .. i .. "<CR>")
  user.bind_key('i', '<A-' .. i .. '>', "<cmd>ToggleTerm " .. i .. "<CR>")
  user.bind_key('t', '<A-' .. i .. '>', "<cmd>ToggleTerm " .. i .. "<CR>")
end

wk.register({[",e"] = { name = "Execute" }})

simple_command('g', 'lazygit', "Lazygit")
simple_command('c', 'cmatrix', "CMatrix")

-- TODO: Make these commands specific to the type of project.
simple_command('n', 'npm i ; read -P ""', "npm install")
simple_command('h', 'home-manager switch --flake /home/pelle/dev/space/home/nixos ; read -P ""', "Nix home-manager")
