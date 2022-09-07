local dap = require('dap')
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = {
        os.getenv("HOME") .. "/.config/debuggers/vscode-php-debug/out/phpDebug.js",
    },
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Launch',
        port = '9003',
        log = true,
        serverSourceRoot = '/srv/www/',
        localSourceRoot = '/home/www/VVV/www/',
    },
    {
        type = 'php',
        request = 'attach',
        name = 'Attach',
        port = '9003',
        cwd = vim.fn.getcwd(),
        log = true,
        serverSourceRoot = '/srv/www/',
        localSourceRoot = '/home/www/VVV/www/',
    },
}
