local dap = require('dap')
-- Install bash debugger from https://github.com/rogalmic/vscode-bash-debug

dap.adapters.bashdb = {
    type = 'executable',
    command = 'bash',
    args = {
        os.getenv("HOME") .. "/.config/debuggers/vscode-bash-debug/out/bashDebug.js",
    },
}

dap.configurations.sh = {
  {
      type = "bashdb",
      request = "launch",
      name = "Bash-Debug (simplest configuration)",
      program = "${file}"
  },
  {
    request = "launch",
    type = "bashdb",
    name = "Bash-Debug (select script from list of sh files)",
    cwd = "${workspaceFolder}",
    program = "${command:SelectScriptName}",
    args = {},
  },
}
