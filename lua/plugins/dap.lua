-- return {}
-- local dap = require('dap')

-- vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='🔷', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapLogPoint', {text='📝', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointCondition', {text='👀', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointRejected', {text='🚨', texthl='', linehl='', numhl=''})

-- local bin_path = vim.fn.stdpath('data') .. '/mason/bin/'

-- return {
--     setup = function()
--         require'dapui'.setup()
--         require("dap-python").setup('~/.virtualenvs/debugpy/bin/python')
--         require("dap-go").setup()
--         require("nvim-dap-virtual-text").setup()
--         require'modules.plugins.dap.php'.setup(bin_path)
--         require'modules.plugins.dap.typescript'.setup(bin_path)
--         require'modules.plugins.dap.csharp'.setup(bin_path)
--         require'modules.plugins.dap.bash'.setup(bin_path)
--     end
-- }
return {
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "Pocco81/DAPInstall.nvim",
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
  },
}
