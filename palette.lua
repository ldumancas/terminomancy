-- Terminomancy Color Palette
--
-- Based on sourcerer by xero harrison
-- https://github.com/xero/sourcerer

local M = {}

-- Background and Foreground
M.bg = "#222222"
M.bg_dark = "#1a1a1a"
M.bg_light = "#2d2d2d"
M.fg = "#c2c2b0"
M.fg_dim = "#a0a08e"

-- Syntax
M.comment = "#8a8a78"
M.string = "#779b70"
M.func = "#faf4c6"
M.keyword = "#8888cc"
M.type = "#7e8aa2"
M.constant = "#e6952a"
M.number = "#cc8800"
M.identifier = "#70b8b8"
M.special = "#719611"
M.preproc = "#528b8b"

-- UI
M.selection = "#3a3a3a"
M.linenr = "#929292"
M.match = "#fff000"
M.search = "#d6e770"

-- Diagnostics
M.error = "#ff6a6a"
M.warning = "#e6952a"
M.info = "#4f94cd"
M.hint = "#2e8b57"

-- Diff (foreground/gutter colors)
M.diff_add = "#3cb371"
M.diff_del = "#aa4450"
M.diff_change = "#4f94cd"

-- Diff backgrounds (subtle tints for readability)
M.diff_add_bg = "#2a3a2a"
M.diff_del_bg = "#3a2828"
M.diff_change_bg = "#28303a"
M.diff_text_bg = "#3a4a5a"

-- Accent
M.accent = "#e6952a"
M.todo = "#8f6f8f"

return M

