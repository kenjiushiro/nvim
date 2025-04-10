-- npm install -g typescript typescript-language-server
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact" },
  callback = function()
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc" -- enable built-in LSP completion

    vim.lsp.start({
      name = "tsserver",
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = vim.fs.dirname(
        vim.fs.find({ "package.json", "tsconfig.json", ".git" }, { upward = true })[1]
      ),
    })
  end,
})
