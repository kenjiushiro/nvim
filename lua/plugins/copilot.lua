return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      provider = "copilot",
    },
    keys = {
      {
        "<leader>p",
        "<cmd>CopilotChatPrompts<cr>",
        desc = "CopilotChat Prompts",
        mode = { "n" },
      },
    },
  },
}
