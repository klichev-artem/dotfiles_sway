-- Arasaka Workstation theme fragment.
-- Add after plugin setup in init.lua.

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "single"
vim.opt.fillchars = { eob = " " }

local c = {
  bg = "#09090B",
  bg_alt = "#111116",
  bg_sel = "#19191F",
  border = "#34343A",
  fg = "#E8E6DF",
  muted = "#8A8680",
  red = "#D33C3C",
  amber = "#D9A441",
  cyan = "#8EF2E3",
  critical = "#FF4D4D",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
hl("FloatBorder", { fg = c.border, bg = c.bg_alt })
hl("Cursor", { fg = c.bg, bg = c.red })
hl("CursorLine", { bg = c.bg_alt })
hl("LineNr", { fg = c.muted, bg = c.bg })
hl("CursorLineNr", { fg = c.red, bg = c.bg_alt, bold = true })
hl("WinSeparator", { fg = c.border, bg = c.bg })
hl("Visual", { fg = c.bg, bg = c.red })
hl("Search", { fg = c.bg, bg = c.amber })
hl("IncSearch", { fg = c.bg, bg = c.red })
hl("StatusLine", { fg = c.fg, bg = c.bg_alt })
hl("StatusLineNC", { fg = c.muted, bg = c.bg })
hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel", { fg = c.bg, bg = c.red })
hl("Comment", { fg = c.muted, italic = true })
hl("String", { fg = c.cyan })
hl("Number", { fg = c.amber })
hl("Boolean", { fg = c.amber })
hl("Function", { fg = c.cyan })
hl("Keyword", { fg = c.red })
hl("Statement", { fg = c.red })
hl("Type", { fg = c.amber })
hl("Special", { fg = c.red })
hl("DiagnosticError", { fg = c.critical })
hl("DiagnosticWarn", { fg = c.amber })
hl("DiagnosticInfo", { fg = c.cyan })
hl("DiagnosticHint", { fg = c.cyan })
hl("GitSignsAdd", { fg = c.cyan })
hl("GitSignsChange", { fg = c.amber })
hl("GitSignsDelete", { fg = c.critical })
