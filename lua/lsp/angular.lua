-- npm install -g @angular/language-server
vim.lsp.start({
  name = "angular",
  cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations", ".",
    "--ngProbeLocations", ".",
  },
  filetypes = { "typescript", "html" },
  root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
  capabilities = capabilities,
  on_attach = on_attach,
})
