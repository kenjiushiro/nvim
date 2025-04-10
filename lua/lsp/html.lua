-- npm install -g vscode-langservers-extracted
vim.lsp.start({
  name = "html",
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
  capabilities = capabilities,
  on_attach = on_attach,
})
