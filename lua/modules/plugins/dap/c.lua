local dap = require('dap')
-- Install node debugger from https://github.com/microsoft/vscode-node-debug2
-- Install chrome debugger from https://github.com/Microsoft/vscode-chrome-debug

local mason_registry = require'mason-registry'

local M = {}

M.setup = function(bin_path)
  local codelldb_debugger = "codelldb"
  local cpptools_debugger = "cpptools"

  if (mason_registry.is_installed(codelldb_debugger)) then
    local codelldbp_path = bin_path .. codelldb_debugger
    local cpptools_path = bin_path .. cpptools_debugger

    dap.adapters.codelldb = {
      type = 'executable',
      command = 'bash',
      args = {
        codelldbp_path,
      },
    }

    dap.adapters.cpptools = {
      type = 'executable',
      command = 'bash',
      args = {
        cpptools_path,
      },
    }
    dap.configurations.c = {
        {
           name = "Launch codelldb",
           type = "codelldb",
           request = "launch",
           -- program = "${file}",
           program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
           end,
           cwd = '${workspaceFolder}',
           externalTerminal = false,
           stopOnEntry = false,
           args = {}
        },
        {
           name = "Launch cpptools",
           type = "codelldb",
           request = "launch",
           program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
           end,
           cwd = '${workspaceFolder}',
           externalTerminal = false,
           stopOnEntry = false,
           args = {}
        },
    }

    -- dap.configurations.c={
    --   name = "c",
    --   type = "cppdbg",
    --   request = "launch",
    --   program = "${workspaceFolder}/a.out",
    --   args = {"arg1", "arg2"},
    --   environment = {{ name = "config", value = "Debug" }},
    --   cwd = "${workspaceFolder}"
    -- }
  end
end

return M
