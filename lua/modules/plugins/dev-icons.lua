local M = {}
M.config = function()
    require("nvim-web-devicons").setup({
        strict = true,
        override_by_filename = {
            ["Dockerfile"] = {
                icon = "",
                color = "#81e043",
                name = "Dockerfile",
            },
        },
        override_by_extension = {
            ["cs"] = {
                icon = "",
                color = "#81e043",
                name = "csharp",
            },
        },
    })
end
return M
