local theme = {
    fill = "TabLineFill",
    -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    bright = { fg = "#282828", bg = "#fabd2f" },
    head = "TabLine",
    current_tab = "TabLineSel",
    tab = "TabLine",
    win = "TabLine",
    tail = "TabLine",
}
require("tabby.tabline").set(function(line)
    return {
        {
            { "  ", hl = theme.bright },
            line.sep("", theme.bright, theme.fill),
        },
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
                line.sep("", theme.fill, hl),
                tab.is_current() and "" or "",
                tab.current_win().file_icon(),
                "",
                tab.name() == "[No Name]" and "Neovim" or tab.name(),
                tab.close_btn(""),
                line.sep("", hl, theme.fill),
                hl = hl,
                margin = " ",
            }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
                line.sep("", theme.win, theme.fill),
                win.is_current() and "" or "",
                win.file_icon(),
                string.sub(win.buf_name(), 1, 1),
                line.sep("", theme.fill, theme.win),
                hl = theme.win,
                margin = " ",
            }
        end),
        {
            line.sep("", theme.tail, theme.fill),
            { "  ", hl = theme.tail },
        },
        hl = theme.fill,
    }
end)
