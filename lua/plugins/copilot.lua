return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "claude-sonnet-4.5",
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
