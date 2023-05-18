if not as._default(vim.g.code_lsp_enabled) then
    return
end

local function common_on_attach(client, bufnr)
    if as._default(vim.g.code_lsp_document_highlight) then
        require("modules.lsp").documentHighlight(client, bufnr)
    end
    require("lsp_signature").on_attach { max_width = 90, fix_pos = true, hint_prefix = " " }
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- mappings
    as.map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
    as.map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
    as.map("n", "gy", ":lua vim.lsp.buf.type_definition()<CR>")
    as.map("n", "gr", ":Lspsaga lsp_finder<CR>")
    as.map("n", "K", ":Lspsaga hover_doc<CR>")
    as.map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
    as.map("n", "<leader>lgD", ":lua vim.lsp.buf.declaration()<CR>")
    as.map("n", "<leader>lgd", ":lua vim.lsp.buf.definition()<CR>")
    as.map("n", "<leader>lgy", ":lua vim.lsp.buf.type_definition()<CR>")
    as.map("n", "<leader>lgr", ":Telescope lsp_references<CR>")
    as.map("n", "<leader>lgi", ":lua vim.lsp.buf.implementation()<CR>")
    as.map("n", "<leader>lh", ":Lspsaga hover_doc<CR>")
    as.map("n", "<leader>lk", ":lua vim.lsp.buf.signature_help()<CR>")
    as.map("n", "<leader>la", ":Lspsaga code_action<CR>")
    as.map("n", "<leader>lc", ":lua vim.diagnostic.hide()<CR>")
    as.map("n", "<leader>lA", ":Telescope lsp_range_code_actions<CR>")
    as.map("n", "<leader>ld", ":Telescope diagnostics bufnr=0<CR>")
    as.map("n", "<leader>lD", ":Telescope diagnostics<CR>")
    as.map("n", "<leader>lr", ":Lspsaga rename<CR>")
    as.map("n", "<leader>lo", ":Lspsaga outline<CR>")
    as.map("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>")
    as.map("n", "<leader>lS", ":Telescope lsp_workspace_symbols<CR>")
    as.map("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>")
    as.map("n", "<leader>lp", ":Lspsaga preview_definition<CR>")
    as.map(
        "n",
        "<leader>ll",
        ":Lspsaga show_line_diagnostics<CR>"
    )
    as.map(
        "n",
        "<c-p>",
        ":Lspsaga diagnostic_jump_prev<CR>"
    )
    as.map(
        "n",
        "<c-n>",
        ":Lspsaga diagnostic_jump_next<CR>"
    )
    as.map("n", "<leader>l,s", [[:LspStop <C-R>=<CR>]], { silent = false })

    as.nvim_set_au(
        "InsertLeave,BufWrite,BufEnter",
        "<buffer>",
        "lua vim.diagnostic.setloclist({open = false})"
    )

    local mappings = {
        ["<leader>"] = {
            l = {
                name = "LSP",
                [","] = { "LSP stop" },
                [",a"] = { "<cmd>LspStop<cr>", "stop all" },
                [",s"] = { "select" },
                A = "code actions (range)",
                D = "diagnostics (project)",
                S = "symbols (project)",
                a = "code actions (cursor)",
                c = "clear diagnostics",
                d = "diagnostics (buffer)",
                f = "format",
                g = { name = "go to" },
                gD = "declaration",
                gd = "definition",
                gi = "implementation",
                gr = "references",
                gy = "type definition",
                h = "hover",
                i = "LSP info",
                k = "signature help",
                l = "line diagnostics",
                p = "peek definition",
                r = "rename",
                s = "symbols (buffer)",
            },
        },
        ["g"] = {
            ["D"] = "LSP declaration",
            ["d"] = "LSP definition",
            ["h"] = "LSP documentation",
            ["i"] = "LSP implementation",
            ["r"] = "LSP references",
            ["y"] = "LSP type definition",
        },
    }

    local wk = require "which-key"
    wk.register(mappings)
end


local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function (server_name)
        local opts = {
            capabilities = require("modules.lsp").capabilities,
            flags = { debounce_text_changes = 150 },
            on_attach = common_on_attach,
            autostart = as._lsp_auto(server_name),
        }
        if server_name == "sumneko_lua" then
          opts.settings = {
              Lua = {
                  diagnostics = {
                      globals = {
                          "vim",
                          "as",
                          "DATA_PATH",
                          "use",
                          "run",
                      },
                  },
                  workspace = {
                      maxPreload = 10000,
                      preloadFileSize = 50000,
                  },
              },
          }
        end
        if server_name == "bashls" then
          opts.filetypes = { "bash", "zsh", "sh" }
        elseif server_name == "omnisharp" then
          local home = os.getenv( "HOME" );
          opts.cmd = { "dotnet", "C:\\Users\\kmu20559\\.vscode\\extensions\\ms-dotnettools.csharp-1.25.7-win32-x64\\.omnisharp\\1.39.6-net6.0\\OmniSharp.dll" }
        end
        lspconfig[server_name].setup(opts)
    end,
})
