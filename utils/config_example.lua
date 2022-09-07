local M = {
    -----------------------------------------------------------------------------//
    --- General Settings {{{1
    -----------------------------------------------------------------------------//
    -- Time in milliseconds to wait for a mapped sequence to complete.
    -- @value: number
    timeoutlen = 300,

    -- If in this many milliseconds nothing is typed the swap file will be
    -- written to disk.
    -- @value: number
    updatetime = 300,

    -- Useful to align text.
    -- @value: number
    colorcolumn = 120,

    -- Keep the cursor as a block in insert mode.
    -- @value: boolean
    cursor_block = false,

    -- Number of screen lines to use for the command-line.
    -- @value: number
    cmdheight = 1,

    -- Minimal number of screen lines to keep above and below the cursor.
    -- @value: number
    scrolloff = 1,

    -- Number of spaces to use for each step of (auto)indent and number
    -- of spaces that a <Tab> counts for.
    -- @value: number
    indent_size = 2,

    -- Show the line number relative to the line with the cursor in front of
    -- each line.
    -- @value: boolean
    relativenumber = true,

    -- Highlight the screen line of the cursor.
    -- @value: boolean
    cursorline = true,

    -- When on, lines longer than the width of the window will wrap and
    -- displaying continues on the next line.
    -- @value: boolean
    word_wrap = false,

    -- Keep the last cursor position when reopening a buffer.
    -- @value: boolean
    preserve_cursor = true,

    -- Adds indentation guides to all lines .
    -- @value: boolean
    indent_guides = false,

    -- Basic trim of trailing white space.
    -- @value: boolean
    trim_trailing_space = true,

    -- Format on save.
    -- @value: boolean
    format_on_save = true,

    -- File explorer side.
    -- @value: string (left or right)
    explorer_side = "right",
    -----------------------------------------------------------------------------//
    --- Colors/Style {{{1
    -----------------------------------------------------------------------------//
    -- Press <space>ht to see all available themes.
    -- @value: string
    colorscheme = "gruvbox",

    -- These option only apply for themes available with themes-nvim.
    -- See :h themes-nvim for help.
    -- @value: boolean
    themes_italic_comment = true,
    themes_italic_keyword = false,
    themes_italic_boolean = true,
    themes_italic_function = true,
    themes_italic_variable = false,

    -- Choose statusline.
    -- @options: classic, arrow, slant
    statusline = "classic",
    -- @options: gruvbox, neon, nord, wombat
    statusline_color = "gruvbox",
    -----------------------------------------------------------------------------//
    --- LSP {{{1
    -----------------------------------------------------------------------------//
    -- If false, all LSP features won't be available.
    -- @value: boolean
    lsp_enabled = true,

    -- Display virtual text like warnings, hints, etc.
    -- @value: boolean
    lsp_virtual_text = false,

    -- Borders for the floating windows of LSP (e. diagnostics).
    -- @value: string
    -- @options: single, double, rounded, none
    lsp_window_borders = "single",

    -- Show function signature when you type.
    -- @value: boolean
    lsp_signature_help = true,

    --  Enable or disable signs from LSP in signcolum.
    -- @value: boolean
    lsp_diagnostic_signs_enabled = true,

    -- If enable, highlights all instances of word under curosr.
    -- @value: boolean
    lsp_document_highlight = false,

    -- Display underline for warnings, info, errors and hints.
    -- @value: boolean
    lsp_diagnostic_underline = true,

    -- By default, all installed servers start automatically, choose which
    -- servers to not start (you can still start them with :LspStart later).
    lsp_autostart_blacklist = { "lua" },
    -----------------------------------------------------------------------------//
    --- Completion {{{1
    -----------------------------------------------------------------------------//
    -- Show autocomplete suggestions as you type. If diasble, the completion
    -- menu has to trigger manually with <C-Space> or <Tab>
    -- @value: boolean
    compe_autocomplete = true,

    -- Borders for documentation in completion menu.
    -- @value: string
    -- @options: single, double, none
    compe_doc_window_border = "single",

    -- Add description text to the suggested items in the completion menu.
    -- @value: boolean
    compe_item_with_text = true,

    -- Autocomplete pairs.
    -- @value: boolean
    compe_autopairs = true,

    -- Number of items to show in the completion menu.
    -- @value: number
    compe_items = 10,
    -----------------------------------------------------------------------------//
    --- Treesitter {{{1
    -----------------------------------------------------------------------------//
    -- Enable or disable all treesitter features.
    -- @value: boolean
    treesitter_enabled = true,

    -- Enable or disable treesitter syntax highlighting.
    -- @value: boolean
    treesitter_highlight = true,

    -- Parsers to install.
    -- @options: string or a table of parsers.
    treesitter_parsers_install = "maintained",

    -- Parsers to ignore during install.
    -- @options: string or a table of parsers.
    treesitter_parsers_ignore = { "turtle", "verilog", "beancount" },
    -----------------------------------------------------------------------------//
    -- Startify {{{1
    -----------------------------------------------------------------------------//
    -- Choose your startify footer.
    -- @value: string
    startify_footer = "",

    -- Position of the startify header.
    -- @options: center, pad
    startify_header_position = "center",

    -- Choose your startify header.
    -- @options: set it equal to "cowsay" to get a cow and a random quote.
    -- You can also set an ascii art as header.
    startify_header_ascii = {
        '8888888b.                    d8b d8b 888     888 d8b               ',
        '888   Y88b                   Y8P Y8P 888     888 Y8P               ',
        '888    888                           888     888                   ',
        '888   d88P .d88b.  88888b.  8888 888 Y88b   d88P 888 88888b.d88b.  ',
        '8888888P" d8P  Y8b 888 "88b "888 888  Y88b d88P  888 888 "888 "88b ',
        '888       88888888 888  888  888 888   Y88o88P   888 888  888  888 ',
        '888       Y8b.     888  888  888 888    Y888P    888 888  888  888 ',
        '888        "Y8888  888  888  888 888     Y8P     888 888  888  888 ',
        '                             888                                   ',
        '                            d88P                                   ',
        '                          888P"                                    '
    },
    -- }}}
}

return M
-- vim:foldmethod=marker
