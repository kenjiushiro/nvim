local dap = require('dap')
-- Install php debugger from https://github.com/xdebug/vscode-php-debug
-- https://xdebug.org/wizard

local M = {}

local mason_registry = require'mason-registry'
local php_debugger = "php-debug-adapter"

M.setup = function(bin_path)
  if (mason_registry.is_installed(php_debugger)) then
    local adapter_path = bin_path .. php_debugger
    dap.adapters.php = {
      type = 'executable',
      command = 'bash',
      args = {
        adapter_path,
      },
    }

    dap.configurations.php = {
      {
        name = "Listen for Xdebug",
        type = "php",
        request = "launch",
        port = function()
          local port
          port = tonumber(vim.fn.input('Port [9003]: ')) or 9003
          print('Debugging port '.. port)
          return port
        end
      },
      {
        name = "Launch currently open script",
        type = "php",
        request = "launch",
        program = "${file}",
        cwd = "${fileDirname}",
        port = 0,
        runtimeArgs = {
          "-dxdebug.start_with_request=yes"
        },
        env = {
          XDEBUG_MODE = "debug,develop",
          XDEBUG_CONFIG = "client_port=${port}"
        }
      },
      {
        name = "Launch Built-in web server",
        type = "php",
        request = "launch",
        runtimeArgs = {
          "-dxdebug.mode=debug",
          "-dxdebug.start_with_request=yes",
          "-S",
          "localhost:0"
        },
        program = "",
        cwd = "${workspaceRoot}",
        port = 9003,
        serverReadyAction = {
          pattern = "Development Server \\(http://localhost:([0-9]+)\\) started",
          uriFormat = "http://localhost:%s",
          action = "openExternally"
        }
      }
    }
  end
end

return M
