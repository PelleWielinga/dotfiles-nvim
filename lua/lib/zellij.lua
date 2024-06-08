local M = {}

local function run_command(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end


local function run_list_command(cmd)
  local items = {}
  local results = run_command(cmd)

  for item in string.gmatch(results, "[a-zA-Z0-9-/]+") do
    table.insert(items, item)
  end

  return items
end

function M.get_sessions()
  return run_list_command("zellij list-sessions -ns")
end

function M.session_exists(session)
  local sessions = M.get_sessions()

  for _, s in pairs(sessions) do
    if s == session then
      return true
    end
  end

  return false
end

function M.get_open_projects()
  if M.session_exists("projects") then
    return run_list_command("zellij --session projects action query-tab-names")
  end

  return {}
end

function M.is_project_open(project)
  local projects = M.get_open_projects()

  for _, p in pairs(projects) do
    if p == project then
      return true
    end
  end

  return false
end

function M.switch_to_tab_or_create(tab)
  if M.is_project_open(tab) then
    M.switch_to_tab(tab)
  else
    M.open_vim_in_new_tab(tab)
  end
end

function M.switch_to_tab(tab)
  local command = "zellij --session projects action go-to-tab-name " .. tab
  run_command(command)
end

function M.open_vim_in_new_tab(tab)
  local home = os.getenv("HOME")
  local dev = home .. "/dev"
  local command = table.concat({
    "zellij",
    "--session projects",
    "action new-tab",
    "--name " .. tab,
    "--cwd " .. dev .. "/" .. tab,
    "--layout compact",
  }, " ")

  run_command(command)
end

return M
