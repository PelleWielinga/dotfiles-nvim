local lfs = require("lfs")
local zellij = require("lib.zellij")

local M = {}

local function ends_with(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end

local function is_regular_dir(path)
  if ends_with(path, ".") then
    return false
  end

  return lfs.attributes(path).mode == "directory"
end

local function is_project_dir(dir)
  if not is_regular_dir(dir) then
    return false
  end

  for child in lfs.dir(dir) do
    if child == ".git" then
      return true
    end
  end

  return false
end

local function find_project_dirs(path, depth)
  if depth > 3 then
    return {}
  end

  if not is_regular_dir(path) then
    return {}
  end

  local found = {}

  for child in lfs.dir(path) do
    local full_path = path .. "/" .. child

    if is_regular_dir(full_path) then
      if is_project_dir(full_path) then
        table.insert(found, full_path)
      else
        for _, result in pairs(find_project_dirs(full_path, depth + 1)) do
          table.insert(found, result)
        end
      end
    end
  end

  return found
end

M._get_projects = function()
  local home = os.getenv("HOME")
  local dev = home .. "/dev"

  local items = find_project_dirs(dev, 0)
  for i, item in pairs(items) do
    items[i] = item:sub(#dev + 2)
  end
  return items
end

M.projects = function(opts)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = "Projects",
      finder = finders.new_table({
        results = M._get_projects(),
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          local project = selection.value

          zellij.switch_to_tab_or_create(project)
        end)
        return true
      end,
    })
    :find()
end

return M
