local M = {}
M.config = function()
    local lualine = require("lualine")
    lualine.setup({
        options = {
            theme = "gruvbox",
            component_separators = "|",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_b = {
                "branch",
                "diff",
                {
                    "diagnostics",
                    sections = { "error", "warn", "info", "hint" },
                    symbols = { error = " " , warn = " ", info = " ", hint = "" },
                },
            },
        },
    })
end
return M
