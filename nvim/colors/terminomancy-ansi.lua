-- Terminomancy ANSI - Neovim Colorscheme for 16-color terminals
-- Use this for Terminal.app or other terminals without true color
--
-- Usage:
--   vim.opt.termguicolors = false
--   vim.cmd("colorscheme terminomancy-ansi")

vim.cmd("highlight clear")
vim.g.colors_name = "terminomancy-ansi"

-- Disable termguicolors for ANSI mode
vim.opt.termguicolors = false

local function hi(group, opts)
    local cmd = "highlight " .. group
    if opts.ctermfg then cmd = cmd .. " ctermfg=" .. opts.ctermfg end
    if opts.ctermbg then cmd = cmd .. " ctermbg=" .. opts.ctermbg end
    if opts.cterm then cmd = cmd .. " cterm=" .. opts.cterm end
    if opts.link then
        vim.cmd("highlight! link " .. group .. " " .. opts.link)
        return
    end
    vim.cmd(cmd)
end

-- ANSI Color Map:
-- 0  black         (bg)
-- 1  red           (diff_del)
-- 2  green         (string)
-- 3  yellow        (accent)
-- 4  blue          (keyword)
-- 5  magenta       (todo)
-- 6  cyan          (preproc)
-- 7  white         (fg)
-- 8  brightblack   (comment)
-- 9  brightred     (error)
-- 10 brightgreen   (diff_add)
-- 11 brightyellow  (number)
-- 12 brightblue    (info)
-- 13 brightmagenta (identifier)
-- 14 brightcyan    (special)
-- 15 brightwhite   (func)

-- Base UI
hi("Normal", { ctermfg = 7, ctermbg = 0 })
hi("NormalFloat", { ctermfg = 7, ctermbg = 8 })
hi("Cursor", { ctermfg = 0, ctermbg = 7 })
hi("CursorLine", { ctermbg = 8, cterm = "NONE" })
hi("CursorColumn", { ctermbg = 8 })
hi("LineNr", { ctermfg = 8 })
hi("CursorLineNr", { ctermfg = 3, cterm = "bold" })
hi("SignColumn", { ctermbg = 0 })
hi("VertSplit", { ctermfg = 8 })
hi("WinSeparator", { ctermfg = 8 })
hi("StatusLine", { ctermfg = 7, ctermbg = 8 })
hi("StatusLineNC", { ctermfg = 8, ctermbg = 0 })
hi("Pmenu", { ctermfg = 7, ctermbg = 8 })
hi("PmenuSel", { ctermfg = 0, ctermbg = 6 })
hi("Search", { ctermfg = 0, ctermbg = 10 })
hi("IncSearch", { ctermfg = 0, ctermbg = 3 })
hi("Visual", { ctermbg = 8 })
hi("MatchParen", { ctermfg = 3, cterm = "bold" })
hi("Folded", { ctermfg = 8, ctermbg = 0 })
hi("ColorColumn", { ctermbg = 8 })

-- Syntax
hi("Comment", { ctermfg = 8, cterm = "italic" })
hi("Constant", { ctermfg = 3 })
hi("String", { ctermfg = 2 })
hi("Number", { ctermfg = 11 })
hi("Boolean", { ctermfg = 3 })
hi("Identifier", { ctermfg = 13 })
hi("Function", { ctermfg = 15 })
hi("Statement", { ctermfg = 4 })
hi("Keyword", { ctermfg = 4 })
hi("Operator", { ctermfg = 7 })
hi("Type", { ctermfg = 12 })
hi("PreProc", { ctermfg = 6 })
hi("Special", { ctermfg = 14 })
hi("Todo", { ctermfg = 5, cterm = "bold" })
hi("Error", { ctermfg = 9 })

-- Treesitter
hi("@comment", { link = "Comment" })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@constant", { link = "Constant" })
hi("@constant.builtin", { ctermfg = 3 })
hi("@function", { ctermfg = 15 })
hi("@function.call", { ctermfg = 15 })
hi("@function.builtin", { ctermfg = 15 })
hi("@method", { ctermfg = 15 })
hi("@method.call", { ctermfg = 15 })
hi("@keyword", { ctermfg = 4 })
hi("@keyword.return", { ctermfg = 4 })
hi("@keyword.function", { ctermfg = 4 })
hi("@keyword.operator", { ctermfg = 4 })
hi("@conditional", { ctermfg = 4 })
hi("@repeat", { ctermfg = 4 })
hi("@type", { ctermfg = 12 })
hi("@type.builtin", { ctermfg = 12 })
hi("@variable", { ctermfg = 7 })
hi("@variable.builtin", { ctermfg = 13 })
hi("@parameter", { ctermfg = 13 })
hi("@property", { ctermfg = 13 })
hi("@field", { ctermfg = 13 })
hi("@punctuation", { ctermfg = 7 })
hi("@operator", { ctermfg = 7 })
hi("@tag", { ctermfg = 4 })
hi("@tag.attribute", { ctermfg = 13 })

-- LSP Diagnostics
hi("DiagnosticError", { ctermfg = 9 })
hi("DiagnosticWarn", { ctermfg = 3 })
hi("DiagnosticInfo", { ctermfg = 12 })
hi("DiagnosticHint", { ctermfg = 10 })
hi("DiagnosticUnderlineError", { ctermfg = 9, cterm = "underline" })
hi("DiagnosticUnderlineWarn", { ctermfg = 3, cterm = "underline" })
hi("DiagnosticUnderlineInfo", { ctermfg = 12, cterm = "underline" })
hi("DiagnosticUnderlineHint", { ctermfg = 10, cterm = "underline" })

-- Diff
hi("DiffAdd", { ctermfg = 10, ctermbg = 0 })
hi("DiffDelete", { ctermfg = 1, ctermbg = 0 })
hi("DiffChange", { ctermfg = 12, ctermbg = 0 })
hi("DiffText", { ctermfg = 7, ctermbg = 8, cterm = "bold" })
hi("diffAdded", { ctermfg = 10 })
hi("diffRemoved", { ctermfg = 1 })
hi("diffChanged", { ctermfg = 12 })

-- Git Signs
hi("GitSignsAdd", { ctermfg = 10 })
hi("GitSignsChange", { ctermfg = 12 })
hi("GitSignsDelete", { ctermfg = 1 })

-- Telescope
hi("TelescopeBorder", { ctermfg = 8 })
hi("TelescopeSelection", { ctermbg = 8 })
hi("TelescopeMatching", { ctermfg = 3, cterm = "bold" })
