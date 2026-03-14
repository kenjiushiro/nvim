return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "🔷", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "👀", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "🚨", texthl = "", linehl = "", numhl = "" })

      local bin_path = vim.fn.stdpath("data") .. "/mason/bin/"
      require("plugins.dap.csharp").setup(bin_path)

      dap.adapters.python = {
        type = "server",
        host = "127.0.0.1",
        port = 5678,
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "attach",
          name = "Attach to debugpy on localhost:5678",
        },
      }

      return {
        setup = function()
          require("dapui").setup()
          require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
          require("dap-go").setup()
          require("nvim-dap-virtual-text").setup({
            enabled = true,
          })
          require("plugins.dap.php").setup(bin_path)
          require("plugins.dap.csharp").setup(bin_path)
          require("plugins.dap.bash").setup(bin_path)
        end,
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "Pocco81/DAPInstall.nvim",
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
  },
}
