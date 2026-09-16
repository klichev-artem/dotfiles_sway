-- Black Foam — Neovim colorscheme
-- Inspired by black ocean foam / monochrome surf

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "blackfoam"

local c = {
  bg       = "#050607",
  bg_alt   = "#0b0d0e",
  surface  = "#111416",
  surface2 = "#1a1f22",
  surface3 = "#232a2d",

  fg       = "#d7dcda",
  fg_soft  = "#b9c0be",
  muted    = "#8f9694",
  comment  = "#5f6766",

  red      = "#e6a0a0",
  orange   = "#e8bc9a",
  yellow   = "#e3d6a4",
  green    = "#b7d7b5",
  cyan     = "#a6d8d0",
  blue     = "#a8c7e6",
  purple   = "#c9b6e4",
  pink     = "#e6b3ca",

  none     = "NONE",
}

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal",       { fg = c.fg, bg = c.bg })
set(0, "NormalNC",     { fg = c.fg_soft, bg = c.bg })
set(0, "NormalFloat",  { fg = c.fg, bg = c.surface })
set(0, "FloatBorder",  { fg = c.cyan, bg = c.surface })

set(0, "Cursor",       { fg = c.bg, bg = c.fg })
set(0, "CursorLine",   { bg = c.surface })
set(0, "CursorColumn", { bg = c.surface })
set(0, "ColorColumn",  { bg = c.bg_alt })

set(0, "LineNr",       { fg = c.comment })
set(0, "CursorLineNr", { fg = c.cyan, bold = true })
set(0, "SignColumn",   { fg = c.muted, bg = c.bg })

set(0, "VertSplit",    { fg = c.surface2, bg = c.bg })
set(0, "WinSeparator", { fg = c.surface2, bg = c.bg })

set(0, "Visual",       { bg = c.surface3 })
set(0, "Search",       { fg = c.bg, bg = c.yellow })
set(0, "IncSearch",    { fg = c.bg, bg = c.orange })
set(0, "CurSearch",    { fg = c.bg, bg = c.orange })
set(0, "MatchParen",   { fg = c.cyan, bg = c.surface2, bold = true })

-- Menus
set(0, "Pmenu",        { fg = c.fg, bg = c.surface })
set(0, "PmenuSel",     { fg = c.bg, bg = c.cyan })
set(0, "PmenuSbar",    { bg = c.surface2 })
set(0, "PmenuThumb",   { bg = c.muted })

-- Statusline / tabs
set(0, "StatusLine",   { fg = c.fg, bg = c.surface2 })
set(0, "StatusLineNC", { fg = c.muted, bg = c.surface })
set(0, "TabLine",      { fg = c.muted, bg = c.surface })
set(0, "TabLineSel",   { fg = c.bg, bg = c.cyan, bold = true })
set(0, "TabLineFill",  { bg = c.bg })

-- Messages
set(0, "ErrorMsg",     { fg = c.red, bold = true })
set(0, "WarningMsg",   { fg = c.yellow, bold = true })
set(0, "ModeMsg",      { fg = c.green })
set(0, "MoreMsg",      { fg = c.green })
set(0, "Question",     { fg = c.cyan })

-- Diff
set(0, "DiffAdd",      { fg = c.green, bg = "#101a13" })
set(0, "DiffChange",   { fg = c.blue, bg = "#101620" })
set(0, "DiffDelete",   { fg = c.red, bg = "#1b1010" })
set(0, "DiffText",     { fg = c.yellow, bg = "#201b10" })

-- Diagnostics
set(0, "DiagnosticError", { fg = c.red })
set(0, "DiagnosticWarn",  { fg = c.yellow })
set(0, "DiagnosticInfo",  { fg = c.blue })
set(0, "DiagnosticHint",  { fg = c.cyan })
set(0, "DiagnosticOk",    { fg = c.green })

set(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red })
set(0, "DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
set(0, "DiagnosticUnderlineInfo",  { undercurl = true, sp = c.blue })
set(0, "DiagnosticUnderlineHint",  { undercurl = true, sp = c.cyan })

-- Syntax
set(0, "Comment",      { fg = c.comment, italic = true })

set(0, "Constant",     { fg = c.orange })
set(0, "String",       { fg = c.green })
set(0, "Character",    { fg = c.green })
set(0, "Number",       { fg = c.orange })
set(0, "Boolean",      { fg = c.orange, bold = true })
set(0, "Float",        { fg = c.orange })

set(0, "Identifier",   { fg = c.fg })
set(0, "Function",     { fg = c.blue })

set(0, "Statement",    { fg = c.purple })
set(0, "Conditional",  { fg = c.purple })
set(0, "Repeat",       { fg = c.purple })
set(0, "Label",        { fg = c.pink })
set(0, "Operator",     { fg = c.cyan })
set(0, "Keyword",      { fg = c.purple, italic = true })
set(0, "Exception",    { fg = c.red })

set(0, "PreProc",      { fg = c.pink })
set(0, "Include",      { fg = c.purple })
set(0, "Define",       { fg = c.pink })
set(0, "Macro",        { fg = c.pink })

set(0, "Type",         { fg = c.yellow })
set(0, "StorageClass", { fg = c.yellow })
set(0, "Structure",    { fg = c.yellow })
set(0, "Typedef",      { fg = c.yellow })

set(0, "Special",      { fg = c.cyan })
set(0, "SpecialChar",  { fg = c.cyan })
set(0, "Delimiter",    { fg = c.muted })
set(0, "Underlined",   { fg = c.blue, underline = true })
set(0, "Todo",         { fg = c.bg, bg = c.yellow, bold = true })

-- Tree-sitter
set(0, "@variable",                    { fg = c.fg })
set(0, "@variable.builtin",            { fg = c.red, italic = true })
set(0, "@variable.parameter",          { fg = c.fg_soft })
set(0, "@variable.member",             { fg = c.cyan })

set(0, "@constant",                    { fg = c.orange })
set(0, "@constant.builtin",            { fg = c.orange, bold = true })
set(0, "@constant.macro",              { fg = c.pink })

set(0, "@module",                      { fg = c.yellow })
set(0, "@label",                       { fg = c.pink })

set(0, "@string",                      { fg = c.green })
set(0, "@string.documentation",        { fg = c.green })
set(0, "@string.escape",               { fg = c.cyan })
set(0, "@string.special",              { fg = c.cyan })

set(0, "@character",                   { fg = c.green })
set(0, "@character.special",           { fg = c.cyan })

set(0, "@boolean",                     { fg = c.orange, bold = true })
set(0, "@number",                      { fg = c.orange })
set(0, "@number.float",                { fg = c.orange })

set(0, "@type",                        { fg = c.yellow })
set(0, "@type.builtin",                { fg = c.yellow, italic = true })
set(0, "@attribute",                   { fg = c.pink })
set(0, "@property",                    { fg = c.cyan })

set(0, "@function",                    { fg = c.blue })
set(0, "@function.builtin",            { fg = c.blue, bold = true })
set(0, "@function.call",               { fg = c.blue })
set(0, "@function.macro",              { fg = c.pink })

set(0, "@constructor",                 { fg = c.yellow })
set(0, "@operator",                    { fg = c.cyan })

set(0, "@keyword",                     { fg = c.purple, italic = true })
set(0, "@keyword.function",            { fg = c.purple, italic = true })
set(0, "@keyword.operator",            { fg = c.purple })
set(0, "@keyword.return",              { fg = c.purple, italic = true })

set(0, "@conditional",                 { fg = c.purple })
set(0, "@repeat",                      { fg = c.purple })
set(0, "@exception",                   { fg = c.red })

set(0, "@punctuation.delimiter",       { fg = c.muted })
set(0, "@punctuation.bracket",         { fg = c.muted })
set(0, "@punctuation.special",         { fg = c.cyan })

set(0, "@comment",                     { fg = c.comment, italic = true })
set(0, "@comment.todo",                { fg = c.bg, bg = c.yellow, bold = true })
set(0, "@comment.error",               { fg = c.bg, bg = c.red, bold = true })
set(0, "@comment.warning",             { fg = c.bg, bg = c.orange, bold = true })
set(0, "@comment.note",                { fg = c.bg, bg = c.blue, bold = true })

set(0, "@markup.heading",              { fg = c.blue, bold = true })
set(0, "@markup.italic",               { italic = true })
set(0, "@markup.strong",               { bold = true })
set(0, "@markup.link",                 { fg = c.cyan, underline = true })
set(0, "@markup.raw",                  { fg = c.green })

-- LSP semantic tokens
set(0, "@lsp.type.namespace",          { fg = c.yellow })
set(0, "@lsp.type.type",               { fg = c.yellow })
set(0, "@lsp.type.class",              { fg = c.yellow })
set(0, "@lsp.type.enum",               { fg = c.yellow })
set(0, "@lsp.type.interface",          { fg = c.yellow })
set(0, "@lsp.type.struct",             { fg = c.yellow })
set(0, "@lsp.type.parameter",          { fg = c.fg_soft })
set(0, "@lsp.type.variable",           { fg = c.fg })
set(0, "@lsp.type.property",           { fg = c.cyan })
set(0, "@lsp.type.enumMember",         { fg = c.orange })
set(0, "@lsp.type.function",           { fg = c.blue })
set(0, "@lsp.type.method",             { fg = c.blue })
set(0, "@lsp.type.macro",              { fg = c.pink })
set(0, "@lsp.type.decorator",          { fg = c.pink })

-- Git signs
set(0, "GitSignsAdd",    { fg = c.green })
set(0, "GitSignsChange", { fg = c.blue })
set(0, "GitSignsDelete", { fg = c.red })

-- Telescope
set(0, "TelescopeNormal",        { fg = c.fg, bg = c.surface })
set(0, "TelescopeBorder",        { fg = c.surface3, bg = c.surface })
set(0, "TelescopePromptNormal",  { fg = c.fg, bg = c.bg_alt })
set(0, "TelescopePromptBorder",  { fg = c.cyan, bg = c.bg_alt })
set(0, "TelescopePromptTitle",   { fg = c.bg, bg = c.cyan, bold = true })
set(0, "TelescopePreviewTitle",  { fg = c.bg, bg = c.green, bold = true })
set(0, "TelescopeResultsTitle",  { fg = c.bg, bg = c.blue, bold = true })
set(0, "TelescopeSelection",     { fg = c.fg, bg = c.surface2 })

-- nvim-cmp
set(0, "CmpItemAbbr",              { fg = c.fg })
set(0, "CmpItemAbbrDeprecated",    { fg = c.comment, strikethrough = true })
set(0, "CmpItemAbbrMatch",         { fg = c.cyan, bold = true })
set(0, "CmpItemAbbrMatchFuzzy",    { fg = c.cyan, bold = true })
set(0, "CmpItemKindFunction",      { fg = c.blue })
set(0, "CmpItemKindMethod",        { fg = c.blue })
set(0, "CmpItemKindVariable",      { fg = c.fg })
set(0, "CmpItemKindKeyword",       { fg = c.purple })
set(0, "CmpItemKindText",          { fg = c.green })
set(0, "CmpItemKindClass",         { fg = c.yellow })
set(0, "CmpItemKindInterface",     { fg = c.yellow })
set(0, "CmpItemKindModule",        { fg = c.yellow })
set(0, "CmpItemKindProperty",      { fg = c.cyan })
set(0, "CmpItemKindUnit",          { fg = c.orange })
set(0, "CmpItemKindSnippet",       { fg = c.pink })

-- Terminal colors
vim.g.terminal_color_0  = "#050607"
vim.g.terminal_color_1  = "#e6a0a0"
vim.g.terminal_color_2  = "#b7d7b5"
vim.g.terminal_color_3  = "#e3d6a4"
vim.g.terminal_color_4  = "#a8c7e6"
vim.g.terminal_color_5  = "#c9b6e4"
vim.g.terminal_color_6  = "#a6d8d0"
vim.g.terminal_color_7  = "#d7dcda"
vim.g.terminal_color_8  = "#5f6766"
vim.g.terminal_color_9  = "#f2b8b8"
vim.g.terminal_color_10 = "#c8e6c1"
vim.g.terminal_color_11 = "#efe4b4"
vim.g.terminal_color_12 = "#b7d4f0"
vim.g.terminal_color_13 = "#dac6f0"
vim.g.terminal_color_14 = "#bae8df"
vim.g.terminal_color_15 = "#f1f4f1"
