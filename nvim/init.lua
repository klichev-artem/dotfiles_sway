-- Plugins:
--   alpha-nvim
--   lualine.nvim
--   telescope.nvim
--   plenary.nvim      (Telescope dependency)
--   nvim-treesitter
-- ============================================================

-- ============================================================
-- HARDENING / EXTERNAL PROVIDERS
-- ============================================================

vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.opt.modeline = false
vim.opt.modelineexpr = false


-- ============================================================
-- LEADER
-- ============================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- ============================================================
-- OPTIONS
-- ============================================================

local opt = vim.opt


-- ------------------------------------------------------------
-- UI
-- ------------------------------------------------------------

opt.number = true
opt.relativenumber = false

opt.termguicolors = true
opt.cursorline = true
opt.cursorlineopt = "number,line"

opt.signcolumn = "yes"
opt.showmode = false
opt.showtabline = 0
opt.laststatus = 3
opt.cmdheight = 1
opt.winborder = "single"


-- ------------------------------------------------------------
-- TEXT / EDITING
-- ------------------------------------------------------------

-- Tab = 4 spaces everywhere.
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.autoindent = true
opt.smartindent = false

-- Comfortable reading of long text.
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪ "

-- Do not insert hard line breaks automatically.
opt.textwidth = 0

-- Keep current line away from screen edges.
opt.scrolloff = 5
opt.sidescrolloff = 4


-- ------------------------------------------------------------
-- SEARCH
-- ------------------------------------------------------------

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true


-- ------------------------------------------------------------
-- WINDOWS
-- ------------------------------------------------------------

opt.splitbelow = true
opt.splitright = true


-- ------------------------------------------------------------
-- FILES / UNDO
-- ------------------------------------------------------------

opt.undofile = true
opt.confirm = true
opt.autoread = true

opt.swapfile = true
opt.backup = false
opt.writebackup = false


-- ------------------------------------------------------------
-- INPUT
-- ------------------------------------------------------------

opt.mouse = "a"

-- Keep clipboard local to Neovim.
opt.clipboard = ""


-- ------------------------------------------------------------
-- PERFORMANCE
-- ------------------------------------------------------------

opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 400


-- ============================================================
-- TEXT FILE DEFAULTS
-- ============================================================

local text_group = vim.api.nvim_create_augroup(
    "Welcome home",
    {
        clear = true,
    }
)

vim.api.nvim_create_autocmd(
    "FileType",
    {
        group = text_group,
        pattern = "*",

        callback = function()
            vim.bo.tabstop = 4
            vim.bo.shiftwidth = 4
            vim.bo.softtabstop = 4
            vim.bo.expandtab = true
        end,
    }
)

-- Plain text and Markdown: keep wrapping comfortable.
vim.api.nvim_create_autocmd(
    "FileType",
    {
        group = text_group,
        pattern = {
            "text",
            "markdown",
        },

        callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
            vim.opt_local.breakindent = true
        end,
    }
)


-- ============================================================
-- NATIVE AUTOCOMPLETE
--
-- Uses only text already open in Neovim.
-- ============================================================

opt.autocomplete = true
opt.autocompletedelay = 110

opt.complete = {
    ".^12",
    "w^8",
    "b^8",
}

opt.completeopt = {
    "menuone",
    "fuzzy",
}

opt.pumheight = 8
opt.pumwidth = 24
opt.pummaxwidth = 48
opt.pumborder = "single"


-- ============================================================
-- FILE SEARCH
-- ============================================================

opt.path:append("**")
opt.wildmenu = true

opt.wildignore:append({
    "*/.git/*",
    "*/__pycache__/*",
    "*.pyc",
    "*.pyo",
    "*/node_modules/*",
    "*/dist/*",
    "*/build/*",
})


-- ============================================================
-- BUILT-IN FILETYPE / SYNTAX
-- ============================================================

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")


-- ============================================================
-- COMMENTS
-- ============================================================

vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = "*",

        callback = function()
            vim.opt_local.formatoptions:remove({
                "c",
                "r",
                "o",
            })
        end,
    }
)


-- ============================================================
-- YANK HIGHLIGHT
-- ============================================================

vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        callback = function()
            vim.highlight.on_yank({
                higroup = "Visual",
                timeout = 120,
            })
        end,
    }
)


-- ============================================================
-- NETRW
-- ============================================================

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 1


-- ============================================================
-- PLUGINS
--
-- Native vim.pack.
-- ============================================================

vim.pack.add({

    {
        src = "https://github.com/goolord/alpha-nvim",
    },

    {
        src = "https://github.com/nvim-lualine/lualine.nvim",
    },

    -- Required by telescope.nvim.
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
    },

    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
    },

    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
    },

})


-- ============================================================
-- TELESCOPE
-- ============================================================

local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        sorting_strategy = "ascending",

        layout_config = {
            prompt_position = "top",
        },

        prompt_prefix = "> ",
        selection_caret = "> ",
    },

    pickers = {
        find_files = {
            hidden = true,
        },
    },
})


-- ============================================================
-- TREESITTER
--
-- Focused on Markdown. Plain .txt files do not need a parser.
--
-- Install once inside Neovim:
--   :TSInstall markdown markdown_inline
--
-- After updating nvim-treesitter:
--   :TSUpdate
-- ============================================================

require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = {
            "markdown",
        },

        callback = function()
            -- If the parser is not installed yet, keep Markdown usable
            -- with Neovim's built-in syntax instead of raising an error.
            pcall(vim.treesitter.start)
        end,
    }
)


-- ============================================================
-- RAW UNIX / WHITE ACCENT PALETTE
--
-- Armour Wash   #000109
-- Benthic Black #03050D
-- Burkablack    #333F4C
-- Atom Blue     #939CAC
--
-- Monochrome UI; white is the only strong accent.
-- ============================================================

local C = {
    bg = "#050505",
    transparent = "NONE",

    surface = "#0A0A0A",
    surface2 = "#121212",

    fg = "#BDBDBD",
    soft = "#8A8A8A",
    muted = "#5A5A5A",
    comment = "#4A4A4A",
    border = "#303030",

    -- semantic aliases remain monochrome
    bright = "#FFFFFF",

    red = "#FFFFFF",
    red_muted = "#8A8A8A",
    red_dark = "#121212",

    cyan = "#FFFFFF",
    magenta = "#BDBDBD",
    green = "#8A8A8A",
    yellow = "#BDBDBD",
    bluegray = "#8A8A8A",
}


-- ============================================================
-- THEME
-- ============================================================

local function hl(group, values)
    vim.api.nvim_set_hl(0, group, values)
end

vim.g.colors_name = "raw-unix-white"

hl("Normal", {
    fg = C.soft,
    bg = C.transparent,
})

hl("NormalNC", {
    fg = C.soft,
    bg = C.transparent,
})

hl("NormalFloat", {
    fg = C.soft,
    bg = C.surface,
})

hl("FloatBorder", {
    fg = C.red_dark,
    bg = C.surface,
})

hl("WinSeparator", {
    fg = C.border,
    bg = C.transparent,
})

hl("CursorLine", {
    bg = C.surface,
})

hl("LineNr", {
    fg = C.muted,
    bg = C.transparent,
})

hl("CursorLineNr", {
    fg = C.bright,
    bg = C.surface,
    bold = true,
})

hl("SignColumn", {
    fg = C.muted,
    bg = C.transparent,
})

hl("Visual", {
    fg = C.bright,
    bg = C.surface2,
})

hl("VisualNOS", {
    fg = C.bright,
    bg = C.surface2,
})

hl("Search", {
    fg = C.bg,
    bg = C.bright,
    bold = true,
})

hl("IncSearch", {
    fg = C.bg,
    bg = C.bright,
    bold = true,
})

hl("CurSearch", {
    fg = C.bg,
    bg = C.bright,
    bold = true,
})

hl("MatchParen", {
    fg = C.cyan,
    bg = C.surface2,
    bold = true,
})

hl("Pmenu", {
    fg = C.soft,
    bg = C.surface,
})

hl("PmenuSel", {
    fg = C.fg,
    bg = C.red_dark,
    bold = true,
})

hl("PmenuSbar", {
    bg = C.surface2,
})

hl("PmenuThumb", {
    bg = C.red_dark,
})

hl("PmenuBorder", {
    fg = C.red_dark,
    bg = C.surface,
})

hl("PmenuMatch", {
    fg = C.cyan,
    bg = C.surface,
    bold = true,
})

hl("PmenuMatchSel", {
    fg = C.cyan,
    bg = C.red_dark,
    bold = true,
})

hl("Comment", {
    fg = C.comment,
    italic = true,
})

hl("Constant", {
    fg = C.cyan,
})

hl("Boolean", {
    fg = C.yellow,
    bold = true,
})

hl("Number", {
    fg = C.yellow,
})

hl("Float", {
    fg = C.yellow,
})

hl("String", {
    fg = C.green,
})

hl("Character", {
    fg = C.green,
})

hl("Identifier", {
    fg = C.fg,
})

hl("Function", {
    fg = C.bright,
    bold = true,
})

hl("Statement", {
    fg = C.bright,
    bold = true,
})

hl("Conditional", {
    fg = C.bright,
    bold = true,
})

hl("Repeat", {
    fg = C.bright,
    bold = true,
})

hl("Keyword", {
    fg = C.bright,
    bold = true,
})

hl("Operator", {
    fg = C.soft,
})

hl("Type", {
    fg = C.bluegray,
})

hl("PreProc", {
    fg = C.yellow,
})

hl("Include", {
    fg = C.yellow,
})

hl("Special", {
    fg = C.bright,
})

hl("Delimiter", {
    fg = C.muted,
})

hl("Title", {
    fg = C.bright,
    bold = true,
})

hl("Directory", {
    fg = C.bright,
})

hl("Question", {
    fg = C.cyan,
})

hl("WarningMsg", {
    fg = C.yellow,
})

hl("ErrorMsg", {
    fg = C.bright,
    bold = true,
})


-- ============================================================
-- ALPHA COLORS
-- ============================================================

hl("AlphaHeader", {
    fg = C.bright,
    bold = true,
})

hl("AlphaButton", {
    fg = C.soft,
})

hl("AlphaShortcut", {
    fg = C.bright,
    bold = true,
})

hl("AlphaFooter", {
    fg = C.cyan,
})


-- ============================================================
-- ALPHA
-- ============================================================

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "⣿⣿⣿⣿⣿⣷⣿⣿⣿⡅⡹⢿⠆⠙⠋⠉⠻⠿⣿⣿⣿⣿⣿⣿⣮⠻⣦⡙⢷⡑⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠡⠌⠂⣙⠻⣛⠻⠷⠐⠈⠛⢱⣮⣷⣽⣿",
    "⣿⣿⣿⣿⡇⢿⢹⣿⣶⠐⠁⠀⣀⣠⣤⠄⠀⠀⠈⠙⠻⣿⣿⣿⣦⣵⣌⠻⣷⢝⠦⠚⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣻⣿⣊⡃⠀⣙⠿⣿⣿⣿⣎⢮⡀⢮⣽⣿⣿",
    "⢿⣿⣿⣿⣧⡸⡎⡛⡩⠖⠀⣴⣿⣿⣿⠀⠀⠀⠀⠸⠇⠀⠙⢿⣿⣿⣿⣷⣌⢷⣑⢷⣄⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣫⠶⠛⠉⠀⠁⠀⠈⠈⠀⠠⠜⠻⣿⣆⢿⣼⣿⣿⣿",
    "⢐⣿⣿⣿⣿⣧⢧⣧⢻⣦⢀⣹⣿⣿⣿⣇⠀⠄⠀⠀⠀⡀⠀⠈⢻⣿⣿⣿⣿⣷⣝⢦⡹⠷⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⠈⠁⠀⠀⠀⠁⠀⠀⠀⠱⣶⣄⡀⠀⠈⠛⠜⣿⣿⣿⣿",
    "⠀⠊⢫⣿⣏⣿⡌⣼⣄⢫⡌⣿⣿⣿⣿⣿⣦⡈⠲⣄⣤⣤⡡⢀⣠⣿⣿⣿⣿⣿⣿⣷⣼⣍⢬⣦⡙⣿⣿⣿⣿⣿⣯⢁⡄⠀⡀⡀⠀⠄⢈⣠⢪⠀⣿⣿⣿⣦⠀⢉⢂⠹⡿⣿⣿",
    "⠀⠀⠄⢹⢃⢻⣟⠙⣿⣦⠱⢻⣿⣿⣿⣿⣿⣿⣷⣬⣍⣭⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡙⢿⣼⡿⣿⣿⣿⣿⣿⣷⣄⠘⣱⢦⣤⡴⡿⢈⣼⣿⣿⣿⣇⣴⣶⣮⣅⢻⣿⡏",
    "⠀⠀⠈⠹⣇⢡⢿⡆⠻⣿⣷⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣍⡻⣿⣟⣻⣿⣿⣿⣿⣷⣦⣥⣬⣤⣴⣾⣿⣿⣿⣿⣷⣿⣿⣿⣿⣷⡜⠃",
    "⠀⠀⠀⢀⣘⠈⢂⠃⣧⡹⣿⣷⡄⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣅⡙⢿⣟⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⡕⠂",
    "⠀⠀⠀⠀⠀⠀⠛⢷⣜⢷⡌⠻⣿⣿⣦⣝⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣹⣷⣦⣹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠉⠃⠀",
}

dashboard.section.header.opts.hl = "AlphaHeader"

dashboard.section.buttons.val = {

    dashboard.button(
        "e",
        "[ E ]  NEW FILE",
        "<cmd>enew<CR>"
    ),

    dashboard.button(
        "f",
        "[ F ]  FILE SYSTEM",
        "<cmd>Explore<CR>"
    ),

    dashboard.button(
        "q",
        "[ Q ]  TERMINATE",
        "<cmd>qa<CR>"
    ),

}

dashboard.section.buttons.opts.hl = "AlphaButton"
dashboard.section.buttons.opts.hl_shortcut = "AlphaShortcut"

dashboard.section.footer.val =
    "TEXT MODE // FULL CONTROL"

dashboard.section.footer.opts.hl = "AlphaFooter"

dashboard.config.layout = {

    {
        type = "padding",
        val = 6,
    },

    dashboard.section.header,

    {
        type = "padding",
        val = 2,
    },

    dashboard.section.buttons,

    {
        type = "padding",
        val = 2,
    },

    dashboard.section.footer,

}

alpha.setup(dashboard.config)


-- ============================================================
-- LUALINE THEME
-- ============================================================

local lualine_theme = {

    normal = {
        a = {
            fg = C.bg,
            bg = C.bright,
            gui = "bold",
        },
        b = {
            fg = C.fg,
            bg = C.surface,
        },
        c = {
            fg = C.muted,
            bg = C.transparent,
        },
    },

    insert = {
        a = {
            fg = C.bg,
            bg = C.fg,
            gui = "bold",
        },
    },

    visual = {
        a = {
            fg = C.bright,
            bg = C.surface2,
            gui = "bold",
        },
    },

    replace = {
        a = {
            fg = C.bg,
            bg = C.bright,
            gui = "bold",
        },
    },

    command = {
        a = {
            fg = C.bg,
            bg = C.bright,
            gui = "bold",
        },
    },

    inactive = {
        a = {
            fg = C.muted,
            bg = C.transparent,
        },
        b = {
            fg = C.muted,
            bg = C.transparent,
        },
        c = {
            fg = C.muted,
            bg = C.transparent,
        },
    },
}


-- ============================================================
-- LUALINE
-- ============================================================

require("lualine").setup({

    options = {
        theme = lualine_theme,
        icons_enabled = false,
        section_separators = "",
        component_separators = "",
        globalstatus = true,

        disabled_filetypes = {
            statusline = {
                "alpha",
            },
        },
    },

    sections = {

        lualine_a = {
            {
                "mode",
                fmt = function(mode)
                    return mode .. " //"
                end,
            },
        },

        lualine_b = {
            {
                "filename",
                path = 1,

                symbols = {
                    modified = " +",
                    readonly = " RO",
                    unnamed = "[NO NAME]",
                    newfile = " NEW",
                },
            },
        },

        lualine_c = {},

        lualine_x = {
            {
                "filetype",
                icons_enabled = false,
            },
        },

        lualine_y = {},

        lualine_z = {
            "location",
        },
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},

        lualine_c = {
            "filename",
        },

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },

})


-- ============================================================
-- TERMINAL ANSI
-- ============================================================

vim.g.terminal_color_0  = "#050505"
vim.g.terminal_color_8  = "#3D3D3D"

vim.g.terminal_color_1  = "#8A8A8A"
vim.g.terminal_color_9  = "#FFFFFF"

vim.g.terminal_color_2  = "#8A8A8A"
vim.g.terminal_color_10 = "#BDBDBD"

vim.g.terminal_color_3  = "#8A8A8A"
vim.g.terminal_color_11 = "#BDBDBD"

vim.g.terminal_color_4  = "#8A8A8A"
vim.g.terminal_color_12 = "#BDBDBD"

vim.g.terminal_color_5  = "#8A8A8A"
vim.g.terminal_color_13 = "#BDBDBD"

vim.g.terminal_color_6  = "#8A8A8A"
vim.g.terminal_color_14 = "#BDBDBD"

vim.g.terminal_color_7  = "#BDBDBD"
vim.g.terminal_color_15 = "#FFFFFF"


-- ============================================================
-- KEYMAPS
-- ============================================================

local map = vim.keymap.set

local function nmap(lhs, rhs, desc)
    map("n", lhs, rhs, {
        desc = desc,
        silent = true,
    })
end

local function vmap(lhs, rhs, desc)
    map("v", lhs, rhs, {
        desc = desc,
        silent = true,
    })
end


-- ------------------------------------------------------------
-- STANDARD VIM / NEOVIM KEYS
--
-- These are built into Neovim, so they are intentionally NOT
-- remapped here. Keeping them native means tutorials, :help and
-- muscle memory continue to work exactly as expected.
--
-- MODES
--   i          insert before cursor
--   a          insert after cursor
--   I          insert at first non-blank character
--   A          insert at end of line
--   o / O      open line below / above
--   v          visual character mode
--   V          visual line mode
--   <C-v>      visual block mode
--   Esc        return to Normal mode
--
-- MOVEMENT
--   h j k l    left / down / up / right
--   w / b / e  next word / previous word / end of word
--   0 / ^ / $  line start / first non-blank / line end
--   gg / G     first / last line
--   {count}G   go to line, e.g. 50G
--   gj / gk    move by wrapped screen lines
--
-- EDITING
--   x          delete character
--   dd         delete line
--   dw         delete word
--   d$ / d0    delete to end / start of line
--   u          undo
--   <C-r>      redo
--   cw / ciw   change word / change inner word
--   .          repeat last change
--
-- YANK / PUT
--   yy         yank line
--   yw         yank word
--   {count}yy  yank N lines, e.g. 5yy
--   p / P      put after / before
--
-- SEARCH
--   /text      search forward
--   ?text      search backward
--   n / N      next / previous match
--   * / #      word under cursor forward / backward
--
-- COMMANDS
--   :w         save
--   :q         quit
--   :wq / :x   save and quit
--   :q!        quit without saving
--
-- Operator + motion is the core Vim model:
--   d + w = dw,  c + iw = ciw,  y + $ = y$
-- ------------------------------------------------------------


-- ------------------------------------------------------------
-- SAVE / QUIT
-- ------------------------------------------------------------

nmap("<leader>w", "<cmd>write<CR>", "Save file")
nmap("<leader>q", "<cmd>quit<CR>", "Quit window")
nmap("<leader>Q", "<cmd>qa<CR>", "Quit Neovim")


-- ------------------------------------------------------------
-- FILES / TELESCOPE
-- ------------------------------------------------------------

nmap("<leader>e", "<cmd>Explore<CR>", "File explorer")
nmap("<leader>f", telescope_builtin.find_files, "Find files")
nmap("<leader>/", telescope_builtin.current_buffer_fuzzy_find, "Find in current buffer")
nmap("<leader>b", telescope_builtin.buffers, "Find buffers")


-- ------------------------------------------------------------
-- BUFFERS
-- ------------------------------------------------------------

nmap("<S-l>", "<cmd>bnext<CR>", "Next buffer")
nmap("<S-h>", "<cmd>bprevious<CR>", "Previous buffer")
nmap("<leader>x", "<cmd>bdelete<CR>", "Close buffer")


-- ------------------------------------------------------------
-- WINDOWS
-- ------------------------------------------------------------

nmap("<C-h>", "<C-w>h", "Focus window left")
nmap("<C-j>", "<C-w>j", "Focus window below")
nmap("<C-k>", "<C-w>k", "Focus window above")
nmap("<C-l>", "<C-w>l", "Focus window right")

-- Useful aliases for native split/window commands.
nmap("<leader>sv", "<cmd>vsplit<CR>", "Vertical split")
nmap("<leader>sh", "<cmd>split<CR>", "Horizontal split")
nmap("<leader>sc", "<C-w>c", "Close window")
nmap("<leader>so", "<C-w>o", "Keep only current window")


-- ------------------------------------------------------------
-- SEARCH
-- ------------------------------------------------------------

-- Esc in Normal mode also clears search highlighting.
nmap("<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")

-- Keep matches centered while retaining the standard n/N meaning.
nmap("n", "nzzzv", "Next search result")
nmap("N", "Nzzzv", "Previous search result")


-- ------------------------------------------------------------
-- VISUAL MODE
-- ------------------------------------------------------------

-- Re-indent without losing the selection.
vmap("<", "<gv", "Indent left and reselect")
vmap(">", ">gv", "Indent right and reselect")

-- Move selected lines while keeping them selected and re-indented.
vmap("J", ":m '>+1<CR>gv=gv", "Move selection down")
vmap("K", ":m '<-2<CR>gv=gv", "Move selection up")


-- ------------------------------------------------------------
-- TERMINAL
-- ------------------------------------------------------------

nmap("<leader>t", "<cmd>terminal<CR>", "Open terminal")

map(
    "t",
    "<Esc><Esc>",
    [[<C-\><C-n>]],
    {
        desc = "Terminal Normal mode",
        silent = true,
    }
)


-- ------------------------------------------------------------
-- AUTOCOMPLETE
-- ------------------------------------------------------------

map(
    "i",
    "<Tab>",
    function()
        if vim.fn.pumvisible() == 1 then
            return "<C-n>"
        end

        return "<Tab>"
    end,
    {
        expr = true,
        desc = "Next completion",
    }
)

map(
    "i",
    "<S-Tab>",
    function()
        if vim.fn.pumvisible() == 1 then
            return "<C-p>"
        end

        return "<S-Tab>"
    end,
    {
        expr = true,
        desc = "Previous completion",
    }
)

map(
    "i",
    "<CR>",
    function()
        if vim.fn.pumvisible() == 1 then
            local info = vim.fn.complete_info({
                "selected",
            })

            if info.selected >= 0 then
                return "<C-y>"
            end
        end

        return "<CR>"
    end,
    {
        expr = true,
        desc = "Accept completion",
    }
)

map(
    "i",
    "<C-e>",
    "<C-e>",
    {
        desc = "Cancel completion",
    }
)


-- ============================================================
-- END
-- ============================================================





