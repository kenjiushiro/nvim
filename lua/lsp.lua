-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>lll", vim.diagnostic.setloclist)

    vim.keymap.set("n", "<leader>lS", vim.lsp.buf.workspace_symbol )
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol )

    vim.keymap.set("n", "<leader>fo", function() vim.lsp.buf.format { async = true } end)

  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

require'lsp.ts'
require'lsp.html'
require'lsp.angular'
