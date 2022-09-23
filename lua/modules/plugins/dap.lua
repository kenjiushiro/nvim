local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='📝', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='👀', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🚨', texthl='', linehl='', numhl=''})

return {
    setup = function()
        require'dapui'.setup()
        require("dap-python").setup('~/.virtualenvs/debugpy/bin/python')
        require("dap-go").setup()
        require'modules.plugins.dap.php'
        require'modules.plugins.dap.bash'
        require("nvim-dap-virtual-text").setup()
    end,
    attach = require'modules.plugins.dap.typescript',
}
