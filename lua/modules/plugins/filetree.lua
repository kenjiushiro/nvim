local M = {}

M.config = function()
    -- local tree_cb = require("nvim-tree.config").nvim_tree_callback
    require("nvim-tree").setup({
        -- disables netrw completely
        disable_netrw = true,
        -- hijack netrw window on startup
        hijack_netrw = true,
        -- closes neovim automatically when the tree is the last **WINDOW** in the view
        -- auto_close = true,
        -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab = false,
        -- hijacks new directory buffers when they are opened.
        -- update_to_buf_dir = {
        --     -- enable the feature
        --     enable = true,
        --     -- allow to open the tree if it was previously closed
        --     auto_open = true,
        -- },
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor = true,
        -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
        update_cwd = true,
        -- show lsp diagnostics in the signcolumn
        diagnostics = { enable = true },
        -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        update_focused_file = {
            -- enables the feature
            enable = true,
            -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
            -- only relevant when `update_focused_file.enable` is true
            update_cwd = false,
            -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
            -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
            ignore_list = {},
        },
        -- configuration options for the system open command (`s` in the tree by default)
        system_open = {
            -- the command to run this, leaving nil should work in most cases
            cmd = nil,
            -- the command arguments as a list
            args = {},
        },

        view = {
            -- width of the window, can be either a number (columns) or a string in `%`
            width = 40,
            -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
            side = vim.g.code_explorer_side or "right",
            -- if true the tree will resize itself after opening a file
            -- auto_resize = false,
        },
    })
    vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
    -- vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_add_trailing = 1
    vim.g.nvim_tree_gitignore = 1
    vim.g.nvim_tree_quit_on_open = 0
    vim.g.nvim_tree_respect_buf_cwd = 1
    vim.g.nvim_tree_disable_window_picker = 1
    vim.g.nvim_tree_icons = {
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            ignored = "◌",
        },
        folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
        },
    }
end

return M
