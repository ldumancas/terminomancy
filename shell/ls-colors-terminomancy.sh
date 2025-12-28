#!/usr/bin/env bash
# Terminomancy LS_COLORS theme for eza/ls
# Color format: 38;2;R;G;B (RGB foreground)
# See: https://github.com/eza-community/eza/blob/main/man/eza_colors.5.md

# Helper function to convert hex to RGB ANSI code
# Usage: rgb "#90b0d1" -> "38;2;144;176;209"
rgb() {
    local hex="${1#\#}"
    local r=$((16#${hex:0:2}))
    local g=$((16#${hex:2:2}))
    local b=$((16#${hex:4:2}))
    printf "38;2;%d;%d;%d" "$r" "$g" "$b"
}

# Terminomancy palette (from palette.lua)
COLOR_FG="$(rgb "#c2c2b0")"           # Foreground
COLOR_FG_DIM="$(rgb "#a0a08e")"       # Dimmed text
COLOR_KEYWORD="$(rgb "#8888cc")"      # Keywords (blue)
COLOR_STRING="$(rgb "#779b70")"       # Strings (green)
COLOR_FUNC="$(rgb "#faf4c6")"         # Functions (light yellow)
COLOR_TYPE="$(rgb "#7e8aa2")"         # Types (purple-gray)
COLOR_CONSTANT="$(rgb "#e6952a")"     # Constants (orange)
COLOR_IDENTIFIER="$(rgb "#70b8b8")"   # Identifiers (cyan)
COLOR_SPECIAL="$(rgb "#719611")"      # Special (olive)
COLOR_PREPROC="$(rgb "#528b8b")"      # Preprocessor (teal)
COLOR_ERROR="$(rgb "#ff6a6a")"        # Errors (red)
COLOR_WARNING="$(rgb "#e6952a")"      # Warnings (orange)
COLOR_DIFF_ADD="$(rgb "#3cb371")"     # Added (green)
COLOR_DIFF_DEL="$(rgb "#aa4450")"     # Deleted (red)

# Build LS_COLORS string using printf to avoid any newline issues
# Format: "filetype=color:extension=color:..."
printf -v LS_COLORS "%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s%s" \
    "di=${COLOR_KEYWORD}" \
    "ln=${COLOR_IDENTIFIER}" \
    "ex=${COLOR_CONSTANT}" \
    "*.sh=${COLOR_FUNC}" \
    "*.bash=${COLOR_FUNC}" \
    "*.zsh=${COLOR_FUNC}" \
    "*.py=${COLOR_FUNC}" \
    "*.js=${COLOR_FUNC}" \
    "*.ts=${COLOR_FUNC}" \
    "*.go=${COLOR_FUNC}" \
    "*.rs=${COLOR_FUNC}" \
    "*.rb=${COLOR_FUNC}" \
    "*.lua=${COLOR_FUNC}" \
    "*.vim=${COLOR_FUNC}" \
    "*.c=${COLOR_FUNC}" \
    "*.cpp=${COLOR_FUNC}" \
    "*.h=${COLOR_FUNC}" \
    "*.hpp=${COLOR_FUNC}" \
    "*.json=${COLOR_TYPE}" \
    "*.yaml=${COLOR_TYPE}" \
    "*.yml=${COLOR_TYPE}" \
    "*.toml=${COLOR_TYPE}" \
    "*.xml=${COLOR_TYPE}" \
    "*.conf=${COLOR_TYPE}" \
    "*.config=${COLOR_TYPE}" \
    "*.ini=${COLOR_TYPE}" \
    "*.md=${COLOR_FG}" \
    "*.txt=${COLOR_FG}" \
    "*.rst=${COLOR_FG}" \
    "*.log=${COLOR_FG_DIM}" \
    "*.tar=${COLOR_CONSTANT}" \
    "*.tgz=${COLOR_CONSTANT}" \
    "*.zip=${COLOR_CONSTANT}" \
    "*.gz=${COLOR_CONSTANT}" \
    "*.bz2=${COLOR_CONSTANT}" \
    "*.xz=${COLOR_CONSTANT}" \
    "*.7z=${COLOR_CONSTANT}" \
    "*.rar=${COLOR_CONSTANT}" \
    "*.jpg=${COLOR_SPECIAL}" \
    "*.jpeg=${COLOR_SPECIAL}" \
    "*.png=${COLOR_SPECIAL}" \
    "*.gif=${COLOR_SPECIAL}" \
    "*.svg=${COLOR_SPECIAL}" \
    "*.webp=${COLOR_SPECIAL}" \
    "*.mp4=${COLOR_SPECIAL}" \
    "*.mkv=${COLOR_SPECIAL}" \
    "*.mp3=${COLOR_SPECIAL}" \
    "*.wav=${COLOR_SPECIAL}" \
    "*.pdf=${COLOR_PREPROC}" \
    "*.doc=${COLOR_PREPROC}" \
    "*.docx=${COLOR_PREPROC}" \
    "*.ppt=${COLOR_PREPROC}" \
    "*.pptx=${COLOR_PREPROC}" \
    "*.xls=${COLOR_PREPROC}" \
    "*.xlsx=${COLOR_PREPROC}" \
    "*.gitignore=${COLOR_FG_DIM}" \
    "*.gitattributes=${COLOR_FG_DIM}" \
    "*.dockerfile=${COLOR_IDENTIFIER}" \
    "*Dockerfile=${COLOR_IDENTIFIER}" \
    "*Makefile=${COLOR_FUNC}" \
    "*README=${COLOR_WARNING}" \
    "*README.md=${COLOR_WARNING}" \
    "*LICENSE=${COLOR_FG_DIM}" \
    "*.lock=${COLOR_FG_DIM}"

export LS_COLORS

# EZA-specific colors (git status, file metadata)
# See: https://github.com/eza-community/eza/blob/main/man/eza_colors-explanation.5.md
printf -v EZA_COLORS "%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s:%s%s" \
    "reset" \
    "ur=${COLOR_FG}" \
    "uw=${COLOR_WARNING}" \
    "ux=${COLOR_CONSTANT}" \
    "ue=${COLOR_ERROR}" \
    "gr=${COLOR_FG}" \
    "gw=${COLOR_WARNING}" \
    "gx=${COLOR_CONSTANT}" \
    "tr=${COLOR_FG}" \
    "tw=${COLOR_WARNING}" \
    "tx=${COLOR_CONSTANT}" \
    "su=${COLOR_ERROR}" \
    "sf=${COLOR_ERROR}" \
    "xa=${COLOR_TYPE}" \
    "sn=${COLOR_FG}" \
    "sb=${COLOR_FG}" \
    "df=${COLOR_FG}" \
    "ds=${COLOR_FG}" \
    "uu=${COLOR_WARNING}" \
    "un=${COLOR_FG_DIM}" \
    "gu=${COLOR_WARNING}" \
    "gn=${COLOR_FG_DIM}" \
    "lc=${COLOR_FG_DIM}" \
    "lm=${COLOR_FG}" \
    "ga=${COLOR_DIFF_ADD}" \
    "gm=${COLOR_WARNING}" \
    "gd=${COLOR_DIFF_DEL}" \
    "gv=${COLOR_IDENTIFIER}" \
    "gt=${COLOR_FG_DIM}" \
    "xx=${COLOR_FG_DIM}" \
    "da=${COLOR_FG}" \
    "in=${COLOR_FG}" \
    "bl=${COLOR_FG}" \
    "hd=${COLOR_KEYWORD}" \
    "lp=${COLOR_IDENTIFIER}" \
    "cc=${COLOR_FG_DIM}"

export EZA_COLORS
