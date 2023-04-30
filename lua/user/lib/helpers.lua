local P = {}

-- Binds a key using either the vim.api.nvim_set_keymap function (which takes a
-- string) or the vim.keymap.set function which takes a function. In both cases
-- the noremap and silent options are set to true.
function P.bind_key(mode, key, value)
  local opts = { noremap = true, silent = true }

  if type(value) == "string" then
    vim.api.nvim_set_keymap(mode, key, value, opts)
  else
    vim.keymap.set(mode, key, value, opts)
  end
end

-- Checks if the current mode is normal mode. If not, it sends the Esc key to
-- exit whatever mode it was in.
function P.ensure_normal_mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local is_normal_mode = current_mode == "n"

  if not is_normal_mode then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  end
end

return P

