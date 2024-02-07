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

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function M.pretty_print(o)
  print(dump(o))
end

return M
