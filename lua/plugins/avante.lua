return {
  "yetone/avante.nvim",
  keys = {
    {
          "<leader>/",
          mode = { "n", "i" },
          function()
            local win_width = vim.o.columns
            vim.cmd("AvanteChat")
            vim.cmd("vertical resize " .. math.floor(win_width / 2))
          end,
          desc = "Open chat window occupying half the screen",
        },
  },
}
