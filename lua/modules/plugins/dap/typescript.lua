local dap = require('dap')
-- Install node debugger from https://github.com/microsoft/vscode-node-debug2
-- Install chrome debugger from https://github.com/Microsoft/vscode-chrome-debug

-- local function debugJest(testName, filename)
--   print("starting " .. testName .. " in " .. filename)
--   dap.run({
--       type = 'node2',
--       request = 'launch',
--       cwd = vim.fn.getcwd(),
--       runtimeArgs = {'--inspect-brk', '/usr/local/bin/jest', '--no-coverage', '-t', testName, '--', filename},
--       sourceMaps = true,
--       protocol = 'inspector',
--       skipFiles = {'<node_internals>/**/*.js'},
--       console = 'integratedTerminal',
--       port = 9229,
--       })
-- end

local mason_registry = require'mason-registry'
local bin_path = vim.fn.stdpath('data') .. '/mason/bin/'

local node_debugger = "node-debug2-adapter"
  if (mason_registry.is_installed(node_debugger)) then
    local adapter_path = bin_path .. node_debugger
    print('Adapter: ' .. adapter_path)

    dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = {
          adapter_path
        },
    }

  local port = 9229
  dap.configurations.typescript = {
      {
        type = 'node2',
        request = 'attach',
        name = "Attach",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        skipFiles = {'<node_internals>/**/*.js'},
        port = function()
          port = tonumber(vim.fn.input('Port [9229]: ')) or 9229
          print('Debugging port '.. port)
          return port
        end
      },
      {
        type = "node2",
        request = "launch",
        stopOnEntry = true,
        name = "Launch Program",
        skipFiles = {
            "<node_internals>/**"
        },
        program = "${file}",
        sourceMaps = true,
        outFiles = {
            "${workspaceFolder}/dist/*.js",
            "${workspaceFolder}/bin/*.js",
            "${workspaceFolder}/out/*.js",
            "${workspaceFolder}/dist/**/*.js",
            "${workspaceFolder}/bin/**/*.js",
            "${workspaceFolder}/out/**/*.js",
        },
      },
      {
          name = "Attach to Chrome",
          port = 9222,
          request = "attach",
          type = "chrome",
          webRoot = "${workspaceFolder}",
      },
  }

  dap.configurations.javascript = {
      {
        type = "node2",
        request = "launch",
        stopOnEntry = true,
        name = "Launch Program",
        skipFiles = {
            "<node_internals>/**"
        },
        program = "${file}"
      },
  }
end


dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {
        os.getenv("HOME") .. "/.config/debuggers/vscode-chrome-debug/out/src/chromeDebug.js",
    },
}
