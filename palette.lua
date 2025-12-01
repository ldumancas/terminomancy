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
M.fg_dim = "#949482"

-- Syntax
M.comment = "#686858"
M.string = "#779b70"
M.func = "#faf4c6"
M.keyword = "#90b0d1"
M.type = "#7e8aa2"
M.constant = "#ff9800"
M.number = "#cc8800"
M.identifier = "#9ebac2"
M.special = "#719611"
M.preproc = "#528b8b"

-- UI
M.selection = "#3a3a3a"
M.linenr = "#878787"
M.match = "#fff000"
M.search = "#d6e770"

-- Diagnostics
M.error = "#ff6a6a"
M.warning = "#ff9800"
M.info = "#4f94cd"
M.hint = "#2e8b57"

-- Diff
M.diff_add = "#3cb371"
M.diff_del = "#aa4450"
M.diff_change = "#4f94cd"

-- Accent
M.accent = "#ff9800"
M.todo = "#8f6f8f"

return M
