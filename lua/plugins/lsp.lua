return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "bash-language-server",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "omnisharp",
        "pyright",
        "typescript-language-server",
      },
    },
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
  },
}
