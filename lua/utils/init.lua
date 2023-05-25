local P = {}

-- Checks if the current mode is normal mode. If not, it sends the Esc key to
-- exit whatever mode it was in.
function P.ensure_normal_mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local is_normal_mode = current_mode == "n"

  if not is_normal_mode then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  end
end

local function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

P.dump = dump

function P.pretty_print(o)
  print(dump(o))
end

return P
