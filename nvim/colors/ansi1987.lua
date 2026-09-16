-- ANSI 1987 — Neovim colorscheme
-- Ported from kitty ANSI 1987 / ANSI-87 palette

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "ansi1987"

local c = {
  bg       = "#000000",
  fg       = "#aaaaaa",
  white    = "#ffffff",

  black    = "#000000",
  gray     = "#555555",

  red      = "#aa0000",
  green    = "#00aa00",
  yellow   = "#aa5500",
  blue     = "#0000aa",
  magenta  = "#aa00aa",
  cyan     = "#00aaaa",

  bred     = "#ff5555",
  bgreen   = "#55ff55",
  byellow  = "#ffff55",
  bblue    = "#5555ff",
  bmagenta = "#ff55ff",
  bcyan    = "#55ffff",

  none     = "NONE",
}

local set = vim.api.nvim_set_hl

-- Base UI
set(0, "Normal",       { fg = c.fg, bg = c.bg })
set(0, "NormalNC",     { fg = c.fg, bg = c.bg })
set(0, "NormalFloat",  { fg = c.fg, bg = c.black })
set(0, "FloatBorder",  { fg = c.gray, bg = c.black })

set(0, "Cursor",       { fg = c.bg, bg = c.fg })
set(0, "CursorLine",   { bg = "#111111" })
set(0, "CursorColumn", { bg = "#111111" })
set(0, "ColorColumn",  { bg = "#111111" })

set(0, "LineNr",       { fg = c.gray, bg = c.bg })
set(0, "CursorLineNr", { fg = c.white, bg = c.bg, bold = true })
set(0, "SignColumn",   { fg = c.gray, bg = c.bg })

set(0, "WinSeparator", { fg = c.gray, bg = c.bg })
set(0, "VertSplit",    { fg = c.gray, bg = c.bg })

set(0, "Visual",       { fg = c.bg, bg = c.fg })
set(0, "Search",       { fg = c.bg, bg = c.byellow })
set(0, "IncSearch",    { fg = c.bg, bg = c.bcyan })
set(0, "CurSearch",    { fg = c.bg, bg = c.bcyan })
set(0, "MatchParen",   { fg = c.bg, bg = c.cyan, bold = true })

-- Popup menu
set(0, "Pmenu",        { fg = c.fg, bg = "#111111" })
set(0, "PmenuSel",     { fg = c.bg, bg = c.fg })
set(0, "PmenuSbar",    { bg = c.gray })
set(0, "PmenuThumb",   { bg = c.fg })

-- Statusline / tabs
set(0, "StatusLine",   { fg = c.bg, bg = c.fg })
set(0, "StatusLineNC", { fg = c.fg, bg = c.gray })
set(0, "TabLine",      { fg = c.fg, bg = c.bg })
set(0, "TabLineSel",   { fg = c.bg, bg = c.fg, bold = true })
set(0, "TabLineFill",  { bg = c.bg })

-- Messages
set(0, "ErrorMsg",     { fg = c.bred, bold = true })
set(0, "WarningMsg",   { fg = c.byellow, bold = true })
set(0, "MoreMsg",      { fg = c.bgreen })
set(0, "ModeMsg",      { fg = c.bcyan })
set(0, "Question",     { fg = c.bgreen })

-- Diff
set(0, "DiffAdd",      { fg = c.bgreen, bg = c.bg })
set(0, "DiffChange",   { fg = c.byellow, bg = c.bg })
set(0, "DiffDelete",   { fg = c.bred, bg = c.bg })
set(0, "DiffText",     { fg = c.bg, bg = c.byellow })

-- Diagnostics
set(0, "DiagnosticError", { fg = c.bred })
set(0, "DiagnosticWarn",  { fg = c.byellow })
set(0, "DiagnosticInfo",  { fg = c.bblue })
set(0, "DiagnosticHint",  { fg = c.bcyan })
set(0, "DiagnosticOk",    { fg = c.bgreen })

set(0, "DiagnosticUnderlineError", { underline = true, sp = c.bred })
set(0, "DiagnosticUnderlineWarn",  { underline = true, sp = c.byellow })
set(0, "DiagnosticUnderlineInfo",  { underline = true, sp = c.bblue })
set(0, "DiagnosticUnderlineHint",  { underline = true, sp = c.bcyan })

-- Classic syntax
set(0, "Comment",      { fg = c.gray, italic = true })

set(0, "Constant",     { fg = c.magenta })
set(0, "String",       { fg = c.green })
set(0, "Character",    { fg = c.green })
set(0, "Number",       { fg = c.cyan })
set(0, "Boolean",      { fg = c.cyan, bold = true })
set(0, "Float",        { fg = c.cyan })

set(0, "Identifier",   { fg = c.fg })
set(0, "Function",     { fg = c.byellow })

set(0, "Statement",    { fg = c.yellow, bold = true })
set(0, "Conditional",  { fg = c.yellow, bold = true })
set(0, "Repeat",       { fg = c.yellow, bold = true })
set(0, "Label",        { fg = c.yellow })
set(0, "Operator",     { fg = c.fg })
set(0, "Keyword",      { fg = c.byellow, bold = true })
set(0, "Exception",    { fg = c.bred, bold = true })

set(0, "PreProc",      { fg = c.magenta })
set(0, "Include",      { fg = c.bmagenta })
set(0, "Define",       { fg = c.magenta })
set(0, "Macro",        { fg = c.magenta })

set(0, "Type",         { fg = c.bgreen })
set(0, "StorageClass", { fg = c.bgreen })
set(0, "Structure",    { fg = c.bgreen })
set(0, "Typedef",      { fg = c.bgreen })

set(0, "Special",      { fg = c.bcyan })
set(0, "SpecialChar",  { fg = c.bcyan })
set(0, "Delimiter",    { fg = c.fg })
set(0, "Underlined",   { fg = c.bblue, underline = true })
set(0, "Todo",         { fg = c.bg, bg = c.byellow, bold = true })

-- Treesitter
set(0, "@comment",                 { fg = c.gray, italic = true })

set(0, "@variable",                { fg = c.fg })
set(0, "@variable.builtin",        { fg = c.bred })
set(0, "@variable.parameter",      { fg = c.fg })
set(0, "@variable.member",         { fg = c.bcyan })

set(0, "@constant",                { fg = c.cyan })
set(0, "@constant.builtin",        { fg = c.bcyan, bold = true })
set(0, "@constant.macro",          { fg = c.magenta })

set(0, "@string",                  { fg = c.green })
set(0, "@string.escape",           { fg = c.bcyan })
set(0, "@character",               { fg = c.green })

set(0, "@boolean",                 { fg = c.bcyan, bold = true })
set(0, "@number",                  { fg = c.cyan })
set(0, "@number.float",            { fg = c.cyan })

set(0, "@type",                    { fg = c.bgreen })
set(0, "@type.builtin",            { fg = c.bgreen, bold = true })
set(0, "@property",                { fg = c.bcyan })
set(0, "@attribute",               { fg = c.magenta })

set(0, "@function",                { fg = c.byellow })
set(0, "@function.call",           { fg = c.byellow })
set(0, "@function.builtin",        { fg = c.byellow, bold = true })
set(0, "@function.method",         { fg = c.byellow })
set(0, "@constructor",             { fg = c.bgreen })

set(0, "@keyword",                 { fg = c.byellow, bold = true })
set(0, "@keyword.function",        { fg = c.byellow, bold = true })
set(0, "@keyword.return",          { fg = c.byellow, bold = true })
set(0, "@keyword.operator",        { fg = c.yellow })
set(0, "@operator",                { fg = c.fg })

set(0, "@conditional",             { fg = c.yellow, bold = true })
set(0, "@repeat",                  { fg = c.yellow, bold = true })
set(0, "@exception",               { fg = c.bred, bold = true })

set(0, "@punctuation.delimiter",   { fg = c.fg })
set(0, "@punctuation.bracket",     { fg = c.fg })
set(0, "@punctuation.special",     { fg = c.bcyan })

set(0, "@markup.heading",          { fg = c.byellow, bold = true })
set(0, "@markup.link",             { fg = c.bblue, underline = true })
set(0, "@markup.raw",              { fg = c.green })
set(0, "@markup.strong",           { bold = true })
set(0, "@markup.italic",           { italic = true })

-- LSP semantic tokens
set(0, "@lsp.type.namespace",      { fg = c.bgreen })
set(0, "@lsp.type.type",           { fg = c.bgreen })
set(0, "@lsp.type.class",          { fg = c.bgreen })
set(0, "@lsp.type.enum",           { fg = c.bgreen })
set(0, "@lsp.type.interface",      { fg = c.bgreen })
set(0, "@lsp.type.struct",         { fg = c.bgreen })
set(0, "@lsp.type.parameter",      { fg = c.fg })
set(0, "@lsp.type.variable",       { fg = c.fg })
set(0, "@lsp.type.property",       { fg = c.bcyan })
set(0, "@lsp.type.enumMember",     { fg = c.cyan })
set(0, "@lsp.type.function",       { fg = c.byellow })
set(0, "@lsp.type.method",         { fg = c.byellow })
set(0, "@lsp.type.macro",          { fg = c.magenta })
set(0, "@lsp.type.decorator",      { fg = c.magenta })

-- GitSigns
set(0, "GitSignsAdd",              { fg = c.bgreen })
set(0, "GitSignsChange",           { fg = c.byellow })
set(0, "GitSignsDelete",           { fg = c.bred })

-- Telescope
set(0, "TelescopeNormal",          { fg = c.fg, bg = c.bg })
set(0, "TelescopeBorder",          { fg = c.gray, bg = c.bg })
set(0, "TelescopeSelection",       { fg = c.bg, bg = c.fg })
set(0, "TelescopePromptNormal",    { fg = c.fg, bg = c.bg })
set(0, "TelescopePromptBorder",    { fg = c.bcyan, bg = c.bg })
set(0, "TelescopePromptTitle",     { fg = c.bg, bg = c.bcyan, bold = true })
set(0, "TelescopePreviewTitle",    { fg = c.bg, bg = c.bgreen, bold = true })
set(0, "TelescopeResultsTitle",    { fg = c.bg, bg = c.bblue, bold = true })

-- nvim-cmp
set(0, "CmpItemAbbr",              { fg = c.fg })
set(0, "CmpItemAbbrDeprecated",    { fg = c.gray, strikethrough = true })
set(0, "CmpItemAbbrMatch",         { fg = c.bcyan, bold = true })
set(0, "CmpItemAbbrMatchFuzzy",    { fg = c.bcyan, bold = true })

set(0, "CmpItemKindFunction",      { fg = c.byellow })
set(0, "CmpItemKindMethod",        { fg = c.byellow })
set(0, "CmpItemKindVariable",      { fg = c.fg })
set(0, "CmpItemKindKeyword",       { fg = c.byellow })
set(0, "CmpItemKindText",          { fg = c.green })
set(0, "CmpItemKindClass",         { fg = c.bgreen })
set(0, "CmpItemKindInterface",     { fg = c.bgreen })
set(0, "CmpItemKindModule",        { fg = c.bgreen })
set(0, "CmpItemKindProperty",      { fg = c.bcyan })
set(0, "CmpItemKindUnit",          { fg = c.cyan })
set(0, "CmpItemKindSnippet",       { fg = c.magenta })

-- Exact ANSI terminal palette
vim.g.terminal_color_0  = "#000000"
vim.g.terminal_color_1  = "#aa0000"
vim.g.terminal_color_2  = "#00aa00"
vim.g.terminal_color_3  = "#aa5500"
vim.g.terminal_color_4  = "#0000aa"
vim.g.terminal_color_5  = "#aa00aa"
vim.g.terminal_color_6  = "#00aaaa"
vim.g.terminal_color_7  = "#aaaaaa"
vim.g.terminal_color_8  = "#555555"
vim.g.terminal_color_9  = "#ff5555"
vim.g.terminal_color_10 = "#55ff55"
vim.g.terminal_color_11 = "#ffff55"
vim.g.terminal_color_12 = "#5555ff"
vim.g.terminal_color_13 = "#ff55ff"
vim.g.terminal_color_14 = "#55ffff"
vim.g.terminal_color_15 = "#ffffff"
