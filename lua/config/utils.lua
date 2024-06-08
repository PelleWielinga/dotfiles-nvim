local M = {}

function M.table_merge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        M.table_merge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end

  return t1
end

function M.table_merge_copy(t1, t2)
  local copy = M.table_deep_copy(t1)
  return M.table_merge(copy, t2)
end

function M.table_deep_copy(t)
  local result = {}

  for k, v in pairs(t) do
    if type(v) == "table" then
      result[k] = M.table_deep_copy(v)
    else
      result[k] = v
    end
  end

  return result
end

function M.dump(object, indent)
  if type(object) == 'table' then
    local new_indent = indent .. '  '

    local s = '{\n'
    for key, v in pairs(object) do
      if type(key) == 'number' then
        s = s .. new_indent .. M.dump(v, new_indent) .. ',\n'
      else
        s = s .. new_indent .. "'" .. key .. "' = " .. M.dump(v, new_indent) .. ',\n'
      end
    end
    return s .. indent .. '}'
  elseif type(object) == 'string' then
    return "'" .. object .. "'"
  else
    return tostring(object)
  end
end

function M.pretty_print(o)
  print(M.dump(o, ""))
end

return M
