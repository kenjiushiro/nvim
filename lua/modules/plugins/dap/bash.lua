local dap = require('dap')

local mason_registry = require'mason-registry'

local M = {}

M.setup = function(bin_path)
  local bash_debugger = "bash-debug-adapter"
  if (mason_registry.is_installed(bash_debugger)) then
    local adapter_path = bin_path .. bash_debugger
    dap.adapters.bashdb = {
      type = "executable",
      command = "bash",
      args = {
        adapter_path,
      },
    }
  end
end

return M
