local M = {}
M.config = function()
    local lualine = require("lualine")
    local colors = {
        blue = "#5E81AC",
        cyan = "#88C0D0",
        black = "#2E3440",
        white = "#ECEFF4",
        red = "#BF616A",
        violet = "#B48EAD",
        grey = "#4C566A",
        green = "#A3BE8C",
        orange = "#D08770",
    }
    lualine.setup({
        options = {
            theme = {
                normal = {
                    a = { fg = colors.black, bg = colors.blue },
                    b = { fg = colors.white, bg = colors.grey },
                    c = { fg = colors.gery, bg = colors.black },
                },

                insert = { a = { fg = colors.black, bg = colors.green } },
                visual = { a = { fg = colors.black, bg = colors.violet } },
                replace = { a = { fg = colors.black, bg = colors.red } },

                inactive = {
                    a = { fg = colors.white, bg = colors.black },
                    b = { fg = colors.white, bg = colors.black },
                    c = { fg = colors.black, bg = colors.black },
                },
            },
            component_separators = "|",
            section_separators = { left = "", right = "" },
        },
    })
end
return M
