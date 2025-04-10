local M = {}

function M.load()
  -- Base Gruvbox palette
  local palette = {
    bg      = "#282828",
    fg      = "#ebdbb2",
    red     = "#fb4934",
    green   = "#b8bb26",
    yellow  = "#fabd2f",
    blue    = "#83a598",
    purple  = "#d3869b",
    aqua    = "#8ec07c",
    gray    = "#a89984",
    orange  = "#fe8019",
  }

  -- Clear previous highlights
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.g.colors_name = "gruvbox-lite"

  -- Basic highlight groups
  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hl("Normal",        { fg = palette.fg, bg = palette.bg })
  hl("Comment",       { fg = palette.gray, italic = true })
  hl("Constant",      { fg = palette.purple })
  hl("String",        { fg = palette.green })
  hl("Function",      { fg = palette.blue })
  hl("Statement",     { fg = palette.red })
  hl("Keyword",       { fg = palette.red })
  hl("Type",          { fg = palette.yellow })
  hl("Special",       { fg = palette.orange })
  hl("Identifier",    { fg = palette.fg })
  hl("Number",        { fg = palette.purple })
  hl("LineNr",        { fg = palette.gray })
  hl("CursorLineNr",  { fg = palette.yellow })
  hl("Visual",        { bg = "#3c3836" })
  hl("Pmenu",         { fg = palette.fg, bg = "#3c3836" })
  hl("PmenuSel",      { fg = palette.bg, bg = palette.blue })
  hl("StatusLine",    { fg = palette.fg, bg = "#3c3836" })
  hl("VertSplit",     { fg = palette.gray })
  hl("Search",        { fg = palette.bg, bg = palette.yellow })

  -- LSP
  hl("DiagnosticError", { fg = palette.red })
  hl("DiagnosticWarn",  { fg = palette.yellow })
  hl("DiagnosticInfo",  { fg = palette.blue })
  hl("DiagnosticHint",  { fg = palette.aqua })

  hl("ErrorMsg",        { fg = palette.red, bold = true })
  hl("WarningMsg",      { fg = palette.yellow, bold = true })
end

return M
