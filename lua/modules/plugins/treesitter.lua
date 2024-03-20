local M = {}

M.config = function()
    if as._default(vim.g.code_treesitter_enabled) then
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c_sharp",
                "bash",
                "c",
                "css",
                "html",
                "dockerfile",
                "dot",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "go",
                "graphql",
                "htmldjango",
                "http",
                "java",
                "javascript",
                "json",
                "json5",
                "jsdoc",
                "jsonnet",
                "lua",
                "markdown",
                "markdown_inline",
                "php",
                "python",
                "regex",
                "rust",
                "ruby",
                "sql",
                "scss",
                "terraform",
                "tsx",
                "typescript",
                "vim",
                "vue",
                "svelte",
            },
            ignore_install = vim.g.code_treesitter_parsers_ignore or {},
            highlight = {
                enable = as._default(vim.g.code_treesitter_highlight), -- false will disable the whole extension
                disable = { "html" },
            },
            indent = { enable = false },
            on_attach = require("modules.plugins.treesitter-on-attach"),
            autopairs = { enable = true },
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                },
            },
        })
    end
end

return M
