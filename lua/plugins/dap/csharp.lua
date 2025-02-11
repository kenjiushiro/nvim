local dap = require("dap")

local M = {}

local mason_registry = require("mason-registry")
local dotnet_debugger = "netcoredbg"

local function getProjectName(directory)
  local extension = ".csproj"

  local handle = io.popen("ls " .. directory)
  for line in handle:lines() do
    if string.sub(line, -string.len(extension)) == extension then
      return string.gsub(line, extension, "")
    end
  end
  handle:close()
  return false
end

local function getProjectVersion(directory, projectName)
  directory = directory .. "/" .. projectName .. ".csproj"
  local xmlTag = "TargetFramework"

  local targetFramework = io.popen("cat " .. directory .. " | grep " .. xmlTag):read()
  local version = string.match(targetFramework, "<" .. xmlTag .. ">(.+)</" .. xmlTag .. ">")
  return version
end

local function selectProjectFromSolution(solutionDir)
  local handle = io.popen("ls -d " .. solutionDir .. "/*/")
  local projectName
  local projects = {}
  for subdir in handle:lines() do
    print(subdir)
    projectName = getProjectName(subdir)
    if projectName then
      table.insert(projects, subdir)
    end
  end

  if next(projects) == nil then
    error("No projects were found")
  else
    local projectNames = "Select project: \n"
    for index, project in ipairs(projects) do
      projectNames = projectNames .. index .. " " .. project .. "\n"
    end

    local selection = vim.fn.input(projectNames)
    return projects[tonumber(selection)]:sub(1, -2)
  end
end

local function getProjectDll()
  local directory = vim.fn.getcwd()
  local projectName = getProjectName(directory)

  if not projectName then
    directory = selectProjectFromSolution(directory)
    projectName = getProjectName(directory)
  end

  local netVersion = getProjectVersion(directory, projectName)
  return directory .. "/bin/Debug/" .. netVersion .. "/" .. projectName .. ".dll"
end

local function getPID()
  local projectDll = getProjectDll()
  local path = string.match(projectDll, "(.+)%..+")

  local pid = io.popen("ps -ef | grep " .. path .. " | awk '{print $2}'"):read()
  return pid
end

M.setup = function(bin_path)
  if mason_registry.is_installed(dotnet_debugger) then
    local adapter_path = bin_path .. dotnet_debugger

    dap.adapters.dotnet = {
      type = "executable",
      command = "bash",
      args = {
        adapter_path,
        "--interpreter=vscode",
      },
    }

    dap.configurations.cs = {
      {
        type = "dotnet",
        name = "Launch - netCoreDbg",
        request = "launch",
        program = function()
          local projectDll = getProjectDll()
          return vim.fn.input("Path to DLL: ", projectDll)
        end,
      },
      {
        type = "dotnet",
        name = "Attach - netCoreDbg",
        request = "attach",
        processId = function()
          local pid = getPID()
          return vim.fn.input("PID: ", pid)
        end,
      },
    }
  end
end

return M
