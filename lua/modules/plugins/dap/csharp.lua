local dap = require('dap')

local M = {}

local mason_registry = require'mason-registry'
  local dotnet_debugger = "netcoredbg"

local function getProjectName()
  local directory = vim.fn.getcwd()
  local extension = '.csproj'

  local handle = io.popen('ls ' .. directory)
  for line in handle:lines() do
    print(line)
    if string.sub(line, -string.len(extension)) == extension then
      return string.gsub(line, extension, "")
    end
  end
  handle:close()
end

local function getProjectVersion(projectName)
  local directory = vim.fn.getcwd() .. '/' .. projectName .. ".csproj"
  local xmlTag = "TargetFramework"

  local targetFramework = io.popen('cat ' .. directory .. ' | grep ' .. xmlTag):read()
  local version = string.match(targetFramework, "<" .. xmlTag .. ">(.+)</" .. xmlTag .. ">")
  return version
end

local function getProjectDll()
  local directory = vim.fn.getcwd()
  local projectName = getProjectName()
  local netVersion = getProjectVersion(projectName)
  return directory .. "/bin/Debug/" .. netVersion .. "/" .. projectName .. ".dll"
end


local function getPID()
  local projectDll = getProjectDll()
  local path = string.match(projectDll, "(.+)%..+")

  local pid = io.popen('ps -ef | grep ' .. path .. " | awk '{print $2}'"):read()
  return pid
end

M.setup = function(bin_path)
  if (mason_registry.is_installed(dotnet_debugger)) then
    local adapter_path = bin_path .. dotnet_debugger

    dap.adapters.dotnet = {
      type = 'executable',
      command = 'bash',
      args = {
        adapter_path,
        "--interpreter=vscode"
      },
    }

    dap.configurations.cs = {
      {
        type = "dotnet",
        name = "Launch - netCoreDbg",
        request = "launch",
        program = function()
          local projectDll = getProjectDll()
          return vim.fn.input('Path to DLL: ', projectDll)
        end,
      },
      {
        type = "dotnet",
        name = "Attach - netCoreDbg",
        request = "attach",
        processId = function()
          local pid = getPID()
          return vim.fn.input('PID: ', pid)
        end,
      }
    }
  end
end

return M
