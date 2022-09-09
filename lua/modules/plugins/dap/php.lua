local dap = require('dap')
-- Install php debugger from https://github.com/xdebug/vscode-php-debug
-- https://xdebug.org/wizard

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = {
        os.getenv("HOME") .. "/.config/debuggers/vscode-php-debug/out/phpDebug.js",
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
