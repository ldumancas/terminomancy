-- Terminomancy - Neovim Colorscheme

local palette_path = vim.fn.fnamemodify(
    debug.getinfo(1, "S").source:sub(2), ":h:h:h"
) .. "/palette.lua"
local c = dofile(palette_path)

vim.cmd("highlight clear")
vim.g.colors_name = "terminomancy"

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Base UI
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg_light })
hi("Cursor", { fg = c.bg, bg = c.fg })
hi("CursorLine", { bg = c.bg_light })
hi("CursorColumn", { bg = c.bg_light })
hi("LineNr", { fg = c.linenr, bg = c.selection })
hi("CursorLineNr", { fg = c.accent, bold = true })
hi("SignColumn", { bg = c.bg })
hi("VertSplit", { fg = c.selection })
hi("WinSeparator", { fg = c.selection })
hi("StatusLine", { fg = c.fg, bg = c.selection })
hi("StatusLineNC", { fg = c.comment, bg = c.selection })
hi("Pmenu", { fg = c.fg, bg = c.selection })
hi("PmenuSel", { fg = c.bg, bg = c.preproc })
hi("Search", { fg = c.bg, bg = c.search })
hi("IncSearch", { fg = c.bg, bg = c.accent })
hi("Visual", { bg = c.selection })
hi("MatchParen", { fg = c.match, bold = true })
hi("Folded", { fg = c.comment, bg = c.bg_dark })
hi("ColorColumn", { bg = c.bg_dark })

-- Syntax
hi("Comment", { fg = c.comment, italic = true })
hi("Constant", { fg = c.constant })
hi("String", { fg = c.string })
hi("Number", { fg = c.number })
hi("Boolean", { fg = c.constant })
hi("Identifier", { fg = c.identifier })
hi("Function", { fg = c.func })
hi("Statement", { fg = c.keyword })
hi("Keyword", { fg = c.keyword })
hi("Operator", { fg = c.fg })
hi("Type", { fg = c.type })
hi("PreProc", { fg = c.preproc })
hi("Special", { fg = c.special })
hi("Todo", { fg = c.todo, bold = true })
hi("Error", { fg = c.error })

-- Treesitter
hi("@comment", { link = "Comment" })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@constant", { link = "Constant" })
hi("@constant.builtin", { fg = c.constant })
hi("@function", { fg = c.func })
hi("@function.call", { fg = c.func })
hi("@function.builtin", { fg = c.func })
hi("@method", { fg = c.func })
hi("@method.call", { fg = c.func })
hi("@keyword", { fg = c.keyword })
hi("@keyword.return", { fg = c.keyword })
hi("@keyword.function", { fg = c.keyword })
hi("@keyword.operator", { fg = c.keyword })
hi("@conditional", { fg = c.keyword })
hi("@repeat", { fg = c.keyword })
hi("@type", { fg = c.type })
hi("@type.builtin", { fg = c.type })
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.identifier })
hi("@parameter", { fg = c.identifier })
hi("@property", { fg = c.identifier })
hi("@field", { fg = c.identifier })
hi("@punctuation", { fg = c.fg })
hi("@operator", { fg = c.fg })
hi("@tag", { fg = c.keyword })
hi("@tag.attribute", { fg = c.identifier })

-- LSP Diagnostics
hi("DiagnosticError", { fg = c.error })
hi("DiagnosticWarn", { fg = c.warning })
hi("DiagnosticInfo", { fg = c.info })
hi("DiagnosticHint", { fg = c.hint })
hi("DiagnosticUnderlineError", {
    undercurl = true,
    sp =
        c.error
})
hi("DiagnosticUnderlineWarn", {
    undercurl = true,
    sp =
        c.warning
})
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.info
})
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.hint
})

-- Diff
hi("DiffAdd", { fg = c.diff_add, bg = c.diff_add_bg })
hi("DiffDelete", { fg = c.diff_del, bg = c.diff_del_bg })
hi("DiffChange", { fg = c.fg, bg = c.diff_change_bg })
hi("DiffText", { fg = c.fg, bg = c.diff_text_bg, bold = true })
hi("diffAdded", { fg = c.diff_add })
hi("diffRemoved", { fg = c.diff_del })
hi("diffChanged", { fg = c.diff_change })

-- Git Signs
hi("GitSignsAdd", { fg = c.diff_add })
hi("GitSignsChange", { fg = c.diff_change })
hi("GitSignsDelete", { fg = c.diff_del })

-- Telescope
hi("TelescopeBorder", { fg = c.comment })
hi("TelescopeSelection", { bg = c.selection })
hi("TelescopeMatching", { fg = c.accent, bold = true })
