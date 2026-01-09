#!/usr/bin/env lua

-- Terminomancy Configuration Generator
-- Generates all config files from palette.lua as single source of truth

local palette = require("palette")

-- Helper function to convert hex to RGB components (0-255)
local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return {
        r = tonumber(hex:sub(1, 2), 16),
        g = tonumber(hex:sub(3, 4), 16),
        b = tonumber(hex:sub(5, 6), 16)
    }
end

-- Helper function to convert hex to RGB components (0-1.0 for iTerm2)
local function hex_to_rgb_float(hex)
    local rgb = hex_to_rgb(hex)
    return {
        r = rgb.r / 255,
        g = rgb.g / 255,
        b = rgb.b / 255
    }
end

-- Generate README.md palette table
local function generate_readme_palette()
    local lines = {
        "## Color Palette",
        "",
        "| Color | Hex | Usage |",
        "|-------|-----|-------|",
    }

    -- Background & Foreground
    table.insert(lines, "| bg | " .. palette.bg .. " | Background |")
    table.insert(lines, "| bg_dark | " .. palette.bg_dark .. " | Darker background |")
    table.insert(lines, "| bg_light | " .. palette.bg_light .. " | Lighter background |")
    table.insert(lines, "| fg | " .. palette.fg .. " | Foreground text |")
    table.insert(lines, "| fg_dim | " .. palette.fg_dim .. " | Dimmed text |")
    table.insert(lines, "")

    -- Syntax
    table.insert(lines, "| comment | " .. palette.comment .. " | Comments |")
    table.insert(lines, "| string | " .. palette.string .. " | Strings |")
    table.insert(lines, "| func | " .. palette.func .. " | Functions |")
    table.insert(lines, "| keyword | " .. palette.keyword .. " | Keywords |")
    table.insert(lines, "| type | " .. palette.type .. " | Types |")
    table.insert(lines, "| constant | " .. palette.constant .. " | Constants |")
    table.insert(lines, "| number | " .. palette.number .. " | Numbers |")
    table.insert(lines, "| identifier | " .. palette.identifier .. " | Identifiers |")
    table.insert(lines, "| special | " .. palette.special .. " | Special characters |")
    table.insert(lines, "| preproc | " .. palette.preproc .. " | Preprocessor |")
    table.insert(lines, "")

    -- UI
    table.insert(lines, "| selection | " .. palette.selection .. " | Selected text |")
    table.insert(lines, "| linenr | " .. palette.linenr .. " | Line numbers |")
    table.insert(lines, "| match | " .. palette.match .. " | Matching brackets |")
    table.insert(lines, "| search | " .. palette.search .. " | Search highlights |")
    table.insert(lines, "")

    -- Diagnostics
    table.insert(lines, "| error | " .. palette.error .. " | Errors |")
    table.insert(lines, "| warning | " .. palette.warning .. " | Warnings |")
    table.insert(lines, "| info | " .. palette.info .. " | Info |")
    table.insert(lines, "| hint | " .. palette.hint .. " | Hints |")
    table.insert(lines, "")

    -- Diff
    table.insert(lines, "| diff_add | " .. palette.diff_add .. " | Added lines |")
    table.insert(lines, "| diff_del | " .. palette.diff_del .. " | Deleted lines |")
    table.insert(lines, "| diff_change | " .. palette.diff_change .. " | Changed lines |")
    table.insert(lines, "| diff_add_bg | " .. palette.diff_add_bg .. " | Added background |")
    table.insert(lines, "| diff_del_bg | " .. palette.diff_del_bg .. " | Deleted background |")
    table.insert(lines, "| diff_change_bg | " .. palette.diff_change_bg .. " | Changed background |")
    table.insert(lines, "| diff_text_bg | " .. palette.diff_text_bg .. " | Diff text background |")
    table.insert(lines, "")

    -- Accent
    table.insert(lines, "| accent | " .. palette.accent .. " | Accent color |")
    table.insert(lines, "| accent_dark | " .. palette.accent_dark .. " | Dark accent |")
    table.insert(lines, "| todo | " .. palette.todo .. " | TODO highlights |")

    return table.concat(lines, "\n")
end

-- Generate tmux config
local function generate_tmux_config()
    return string.format([[# Terminomancy - tmux theme
#
# Source this file in your .tmux.conf:
#   source-file /path/to/terminomancy/tmux/terminomancy.conf

# Palette (from palette.lua)
# bg           %s
# bg_dark      %s
# bg_light     %s
# fg           %s
# fg_dim       %s
# accent       %s
# accent_dark  %s
# comment      %s
# error        %s
# diff_add     %s
# diff_del     %s

# Pane styling
set -g window-style 'fg=%s,bg=%s'
set -g window-active-style 'fg=%s,bg=%s'
set -g pane-border-style 'fg=%s'
set -g pane-active-border-style 'fg=%s,bold'

# Status bar
set -g status-style 'fg=%s,bg=%s'
set -g status-left-style 'fg=%s,bg=%s,bold'
set -g status-right-style 'fg=%s'

# Window status
set -g window-status-style 'fg=%s'
set -g window-status-current-style 'fg=%s,bg=%s,bold'

# Message/command styling
set -g message-style 'fg=%s,bg=%s'
set -g message-command-style 'fg=%s,bg=%s'

# Copy mode
set -g mode-style 'fg=%s,bg=%s'
]],
        palette.bg, palette.bg_dark, palette.bg_light, palette.fg, palette.fg_dim,
        palette.accent, palette.accent_dark, palette.comment, palette.error,
        palette.diff_add, palette.diff_del,
        -- Pane styling
        palette.fg_dim, palette.bg_dark,  -- window-style
        palette.fg, palette.bg,            -- window-active-style
        palette.bg_light,                  -- pane-border-style
        palette.accent,                    -- pane-active-border-style
        -- Status bar
        palette.bg, palette.accent,        -- status-style
        palette.bg, palette.accent_dark,   -- status-left-style
        palette.bg,                        -- status-right-style
        -- Window status
        palette.bg,                        -- window-status-style
        palette.bg, palette.accent_dark,   -- window-status-current-style
        -- Message/command styling
        palette.fg, palette.selection,     -- message-style
        palette.fg, palette.selection,     -- message-command-style
        -- Copy mode
        palette.bg, palette.search         -- mode-style
    )
end

-- Generate iTerm2 JSON
local function generate_iterm2_json()
    local function rgb_to_iterm_color(hex)
        local rgb = hex_to_rgb_float(hex)
        return string.format([[
    "Red Component" : %.10f,
    "Color Space" : "sRGB",
    "Blue Component" : %.10f,
    "Alpha Component" : 1,
    "Green Component" : %.10f]], rgb.r, rgb.b, rgb.g)
    end

    return string.format([[{
  "Ansi 0 Color" : {
%s
  },
  "Ansi 1 Color" : {
%s
  },
  "Ansi 2 Color" : {
%s
  },
  "Ansi 3 Color" : {
%s
  },
  "Ansi 4 Color" : {
%s
  },
  "Ansi 5 Color" : {
%s
  },
  "Ansi 6 Color" : {
%s
  },
  "Ansi 7 Color" : {
%s
  },
  "Ansi 8 Color" : {
%s
  },
  "Ansi 9 Color" : {
%s
  },
  "Ansi 10 Color" : {
%s
  },
  "Ansi 11 Color" : {
%s
  },
  "Ansi 12 Color" : {
%s
  },
  "Ansi 13 Color" : {
%s
  },
  "Ansi 14 Color" : {
%s
  },
  "Ansi 15 Color" : {
%s
  },
  "Background Color" : {
%s
  },
  "Bold Color" : {
%s
  },
  "Cursor Color" : {
%s
  },
  "Cursor Text Color" : {
%s
  },
  "Foreground Color" : {
%s
  },
  "Selected Text Color" : {
%s
  },
  "Selection Color" : {
%s
  }
}
]],
        rgb_to_iterm_color(palette.bg),        -- Ansi 0 (black)
        rgb_to_iterm_color(palette.diff_del),  -- Ansi 1 (red)
        rgb_to_iterm_color(palette.string),    -- Ansi 2 (green)
        rgb_to_iterm_color(palette.accent),    -- Ansi 3 (yellow)
        rgb_to_iterm_color(palette.keyword),   -- Ansi 4 (blue)
        rgb_to_iterm_color(palette.todo),      -- Ansi 5 (magenta)
        rgb_to_iterm_color(palette.preproc),   -- Ansi 6 (cyan)
        rgb_to_iterm_color(palette.fg),        -- Ansi 7 (white)
        rgb_to_iterm_color(palette.comment),   -- Ansi 8 (bright black)
        rgb_to_iterm_color(palette.error),     -- Ansi 9 (bright red)
        rgb_to_iterm_color(palette.diff_add),  -- Ansi 10 (bright green)
        rgb_to_iterm_color(palette.number),    -- Ansi 11 (bright yellow)
        rgb_to_iterm_color(palette.info),      -- Ansi 12 (bright blue)
        rgb_to_iterm_color(palette.identifier),-- Ansi 13 (bright magenta)
        rgb_to_iterm_color(palette.special),   -- Ansi 14 (bright cyan)
        rgb_to_iterm_color(palette.func),      -- Ansi 15 (bright white)
        rgb_to_iterm_color(palette.bg),        -- Background
        rgb_to_iterm_color(palette.func),      -- Bold
        rgb_to_iterm_color(palette.accent),    -- Cursor
        rgb_to_iterm_color(palette.bg),        -- Cursor Text
        rgb_to_iterm_color(palette.fg),        -- Foreground
        rgb_to_iterm_color(palette.fg),        -- Selected Text
        rgb_to_iterm_color(palette.selection)  -- Selection
    )
end

-- Generate Windows Terminal JSON theme
local function generate_windows_terminal_json()
    return string.format([[{
    "name": "Terminomancy",
    "background": "%s",
    "foreground": "%s",
    "cursorColor": "%s",
    "selectionBackground": "%s",
    "black": "%s",
    "red": "%s",
    "green": "%s",
    "yellow": "%s",
    "blue": "%s",
    "purple": "%s",
    "cyan": "%s",
    "white": "%s",
    "brightBlack": "%s",
    "brightRed": "%s",
    "brightGreen": "%s",
    "brightYellow": "%s",
    "brightBlue": "%s",
    "brightPurple": "%s",
    "brightCyan": "%s",
    "brightWhite": "%s"
}
]],
        palette.bg,
        palette.fg,
        palette.accent,
        palette.selection,
        palette.bg,
        palette.diff_del,
        palette.string,
        palette.accent,
        palette.keyword,
        palette.todo,
        palette.preproc,
        palette.fg,
        palette.comment,
        palette.error,
        palette.diff_add,
        palette.number,
        palette.info,
        palette.identifier,
        palette.special,
        palette.func
    )
end

-- Generate Blink.sh theme
local function generate_blink_js()
    return string.format([[// Terminomancy color scheme for Blink.sh
// Generated from palette.lua

black = '%s';
red = '%s';
green = '%s';
yellow = '%s';
blue = '%s';
magenta = '%s';
cyan = '%s';
white = '%s';
lightBlack = '%s';
lightRed = '%s';
lightGreen = '%s';
lightYellow = '%s';
lightBlue = '%s';
lightMagenta = '%s';
lightCyan = '%s';
lightWhite = '%s';

background = '%s';
foreground = '%s';
cursor = '%s';

// Export colors
t.prefs_.set('color-palette-overrides', [
    black, red, green, yellow,
    blue, magenta, cyan, white,
    lightBlack, lightRed, lightGreen, lightYellow,
    lightBlue, lightMagenta, lightCyan, lightWhite
]);

t.prefs_.set('background-color', background);
t.prefs_.set('foreground-color', foreground);
t.prefs_.set('cursor-color', cursor);
]],
        palette.bg,
        palette.diff_del,
        palette.string,
        palette.accent,
        palette.keyword,
        palette.todo,
        palette.preproc,
        palette.fg,
        palette.comment,
        palette.error,
        palette.diff_add,
        palette.number,
        palette.info,
        palette.identifier,
        palette.special,
        palette.func,
        palette.bg,
        palette.fg,
        palette.accent
    )
end

-- Generate Bat theme (TextMate XML format)
local function generate_bat_theme()
    return string.format([[<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>name</key>
    <string>Terminomancy</string>
    <key>settings</key>
    <array>
        <!-- Global Settings -->
        <dict>
            <key>settings</key>
            <dict>
                <key>background</key>
                <string>%s</string>
                <key>foreground</key>
                <string>%s</string>
                <key>caret</key>
                <string>%s</string>
                <key>lineHighlight</key>
                <string>%s</string>
                <key>selection</key>
                <string>%s</string>
                <key>selectionBorder</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Comments -->
        <dict>
            <key>name</key>
            <string>Comment</string>
            <key>scope</key>
            <string>comment, punctuation.definition.comment</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
                <key>fontStyle</key>
                <string>italic</string>
            </dict>
        </dict>

        <!-- Strings -->
        <dict>
            <key>name</key>
            <string>String</string>
            <key>scope</key>
            <string>string</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Numbers -->
        <dict>
            <key>name</key>
            <string>Number</string>
            <key>scope</key>
            <string>constant.numeric</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Constants & Booleans -->
        <dict>
            <key>name</key>
            <string>Constant</string>
            <key>scope</key>
            <string>constant.language, constant.character, constant.other</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Keywords -->
        <dict>
            <key>name</key>
            <string>Keyword</string>
            <key>scope</key>
            <string>keyword, storage.type, storage.modifier</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Functions -->
        <dict>
            <key>name</key>
            <string>Function</string>
            <key>scope</key>
            <string>entity.name.function, support.function</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Types & Classes -->
        <dict>
            <key>name</key>
            <string>Type</string>
            <key>scope</key>
            <string>entity.name.type, entity.name.class, support.type, support.class</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Variables & Parameters -->
        <dict>
            <key>name</key>
            <string>Variable</string>
            <key>scope</key>
            <string>variable, variable.parameter, variable.other</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Operators & Special -->
        <dict>
            <key>name</key>
            <string>Operator</string>
            <key>scope</key>
            <string>keyword.operator, punctuation.separator, punctuation.terminator</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Preprocessor & Directives -->
        <dict>
            <key>name</key>
            <string>Preprocessor</string>
            <key>scope</key>
            <string>keyword.control.import, keyword.control.directive, meta.preprocessor</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Tags (HTML/XML) -->
        <dict>
            <key>name</key>
            <string>Tag</string>
            <key>scope</key>
            <string>entity.name.tag, punctuation.definition.tag</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Attributes -->
        <dict>
            <key>name</key>
            <string>Attribute</string>
            <key>scope</key>
            <string>entity.other.attribute-name</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- JSON Keys -->
        <dict>
            <key>name</key>
            <string>JSON Key</string>
            <key>scope</key>
            <string>support.type.property-name.json, meta.structure.dictionary.key.json</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- YAML Keys -->
        <dict>
            <key>name</key>
            <string>YAML Key</string>
            <key>scope</key>
            <string>entity.name.tag.yaml</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Markdown Headings -->
        <dict>
            <key>name</key>
            <string>Markdown Heading</string>
            <key>scope</key>
            <string>markup.heading, entity.name.section</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
                <key>fontStyle</key>
                <string>bold</string>
            </dict>
        </dict>

        <!-- Markdown Bold -->
        <dict>
            <key>name</key>
            <string>Markdown Bold</string>
            <key>scope</key>
            <string>markup.bold</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
                <key>fontStyle</key>
                <string>bold</string>
            </dict>
        </dict>

        <!-- Markdown Italic -->
        <dict>
            <key>name</key>
            <string>Markdown Italic</string>
            <key>scope</key>
            <string>markup.italic</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
                <key>fontStyle</key>
                <string>italic</string>
            </dict>
        </dict>

        <!-- Markdown Code -->
        <dict>
            <key>name</key>
            <string>Markdown Code</string>
            <key>scope</key>
            <string>markup.inline.raw, markup.raw.block</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Diff Added -->
        <dict>
            <key>name</key>
            <string>Diff Added</string>
            <key>scope</key>
            <string>markup.inserted, meta.diff.header.from-file, punctuation.definition.inserted</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Diff Deleted -->
        <dict>
            <key>name</key>
            <string>Diff Deleted</string>
            <key>scope</key>
            <string>markup.deleted, meta.diff.header.to-file, punctuation.definition.deleted</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Diff Changed -->
        <dict>
            <key>name</key>
            <string>Diff Changed</string>
            <key>scope</key>
            <string>markup.changed, punctuation.definition.changed</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>

        <!-- Invalid/Error -->
        <dict>
            <key>name</key>
            <string>Invalid</string>
            <key>scope</key>
            <string>invalid, invalid.illegal</string>
            <key>settings</key>
            <dict>
                <key>foreground</key>
                <string>%s</string>
            </dict>
        </dict>
    </array>
    <key>uuid</key>
    <string>terminomancy-bat-theme</string>
</dict>
</plist>
]],
        -- Global settings
        palette.bg, palette.fg, palette.fg, palette.bg_light, palette.bg_light, palette.bg_light,
        -- Comment
        palette.comment,
        -- String
        palette.string,
        -- Number
        palette.number,
        -- Constant
        palette.constant,
        -- Keyword
        palette.keyword,
        -- Function
        palette.func,
        -- Type
        palette.type,
        -- Variable
        palette.identifier,
        -- Operator/Special
        palette.special,
        -- Preprocessor
        palette.preproc,
        -- Tag
        palette.keyword,
        -- Attribute
        palette.func,
        -- JSON Key
        palette.identifier,
        -- YAML Key
        palette.identifier,
        -- Markdown Heading
        palette.func,
        -- Markdown Bold
        palette.constant,
        -- Markdown Italic
        palette.identifier,
        -- Markdown Code
        palette.string,
        -- Diff Added
        palette.diff_add,
        -- Diff Deleted
        palette.diff_del,
        -- Diff Changed
        palette.diff_change,
        -- Invalid/Error
        palette.error
    )
end

-- Generate LS_COLORS script
local function generate_ls_colors()
    return string.format([[#!/usr/bin/env bash
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
    printf "38;2;%%d;%%d;%%d" "$r" "$g" "$b"
}

# Terminomancy palette (from palette.lua)
COLOR_FG="$(rgb "%s")"           # Foreground
COLOR_FG_DIM="$(rgb "%s")"       # Dimmed text
COLOR_KEYWORD="$(rgb "%s")"      # Keywords (blue)
COLOR_STRING="$(rgb "%s")"       # Strings (green)
COLOR_FUNC="$(rgb "%s")"         # Functions (light yellow)
COLOR_TYPE="$(rgb "%s")"         # Types (purple-gray)
COLOR_CONSTANT="$(rgb "%s")"     # Constants (orange)
COLOR_IDENTIFIER="$(rgb "%s")"   # Identifiers (cyan)
COLOR_SPECIAL="$(rgb "%s")"      # Special (olive)
COLOR_PREPROC="$(rgb "%s")"      # Preprocessor (teal)
COLOR_ERROR="$(rgb "%s")"        # Errors (red)
COLOR_WARNING="$(rgb "%s")"      # Warnings (orange)
COLOR_DIFF_ADD="$(rgb "%s")"     # Added (green)
COLOR_DIFF_DEL="$(rgb "%s")"     # Deleted (red)

# Build LS_COLORS string using printf to avoid any newline issues
# Format: "filetype=color:extension=color:..."
printf -v LS_COLORS "%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s%%s" \
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
printf -v EZA_COLORS "%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s:%%s%%s" \
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
]],
        palette.fg, palette.fg_dim, palette.keyword, palette.string,
        palette.func, palette.type, palette.constant, palette.identifier,
        palette.special, palette.preproc, palette.error, palette.warning,
        palette.diff_add, palette.diff_del
    )
end

-- Helper to strip # from hex colors (for foot format)
local function hex_strip(hex)
    return hex:gsub("#", "")
end

-- Generate Foot terminal config
local function generate_foot_config()
    return string.format([[# Terminomancy - Foot terminal theme
# Generated from palette.lua
#
# Copy to ~/.config/foot/foot.ini or include via:
#   include=~/.config/terminomancy/foot/foot.ini

[main]
# Font configuration (uncomment and adjust as needed)
# font=monospace:size=12

[colors]
# Cursor (foreground background)
cursor=%s %s
# Base colors
foreground=%s
background=%s

# Selection
selection-foreground=%s
selection-background=%s

# URL color
urls=%s

# Regular colors (0-7)
regular0=%s
regular1=%s
regular2=%s
regular3=%s
regular4=%s
regular5=%s
regular6=%s
regular7=%s

# Bright colors (8-15)
bright0=%s
bright1=%s
bright2=%s
bright3=%s
bright4=%s
bright5=%s
bright6=%s
bright7=%s
]],
        -- Cursor: bg on accent
        hex_strip(palette.bg), hex_strip(palette.accent),
        -- Foreground/Background
        hex_strip(palette.fg),
        hex_strip(palette.bg),
        -- Selection
        hex_strip(palette.fg),
        hex_strip(palette.selection),
        -- URLs
        hex_strip(palette.info),
        -- Regular 0-7
        hex_strip(palette.bg),         -- black
        hex_strip(palette.diff_del),   -- red
        hex_strip(palette.string),     -- green
        hex_strip(palette.accent),     -- yellow
        hex_strip(palette.keyword),    -- blue
        hex_strip(palette.todo),       -- magenta
        hex_strip(palette.preproc),    -- cyan
        hex_strip(palette.fg),         -- white
        -- Bright 8-15
        hex_strip(palette.comment),    -- bright black
        hex_strip(palette.error),      -- bright red
        hex_strip(palette.diff_add),   -- bright green
        hex_strip(palette.number),     -- bright yellow
        hex_strip(palette.info),       -- bright blue
        hex_strip(palette.identifier), -- bright magenta
        hex_strip(palette.special),    -- bright cyan
        hex_strip(palette.func)        -- bright white
    )
end

-- Generate Sway window colors
local function generate_sway_colors()
    return string.format([[# Terminomancy - Sway window colors
# Generated from palette.lua
#
# Include in your sway config:
#   include ~/.config/terminomancy/sway/colors

# class                 border    background  text      indicator   child_border
client.focused          %s   %s     %s   %s     %s
client.focused_inactive %s   %s     %s   %s     %s
client.unfocused        %s   %s     %s   %s     %s
client.urgent           %s   %s     %s   %s     %s
]],
        -- focused: accent border, dark bg, normal text
        palette.accent, palette.bg, palette.fg, palette.accent, palette.accent,
        -- focused_inactive: subtle border, darker bg, dim text
        palette.bg_light, palette.bg_dark, palette.fg_dim, palette.bg_light, palette.bg_light,
        -- unfocused: subtle border, darker bg, comment-colored text
        palette.bg_light, palette.bg_dark, palette.comment, palette.bg_light, palette.bg_light,
        -- urgent: error color everywhere
        palette.error, palette.error, palette.bg, palette.error, palette.error
    )
end

-- Main execution
print("Generating Terminomancy configs from palette.lua...")

-- Write README palette section
local readme_palette = generate_readme_palette()
local f = io.open("README_PALETTE.md", "w")
if f then
    f:write(readme_palette)
    f:close()
    print("✓ Generated README_PALETTE.md")
end

-- Write tmux config
local tmux_config = generate_tmux_config()
f = io.open("tmux/terminomancy.conf", "w")
if f then
    f:write(tmux_config)
    f:close()
    print("✓ Generated tmux/terminomancy.conf")
end

-- Write iTerm2 config
local iterm_json = generate_iterm2_json()
f = io.open("terminals/terminomancy-iterm.json", "w")
if f then
    f:write(iterm_json)
    f:close()
    print("✓ Generated terminals/terminomancy-iterm.json")
end

-- Write Windows Terminal config
local wt_json = generate_windows_terminal_json()
f = io.open("terminals/windows-terminal.json", "w")
if f then
    f:write(wt_json)
    f:close()
    print("✓ Generated terminals/windows-terminal.json")
end

-- Write Blink.sh config
local blink_js = generate_blink_js()
f = io.open("terminals/blink.js", "w")
if f then
    f:write(blink_js)
    f:close()
    print("✓ Generated terminals/blink.js")
end

-- Write Bat theme
local bat_theme = generate_bat_theme()
f = io.open("bat/Terminomancy.tmTheme", "w")
if f then
    f:write(bat_theme)
    f:close()
    print("✓ Generated bat/Terminomancy.tmTheme")
end

-- Write LS_COLORS script
local ls_colors = generate_ls_colors()
f = io.open("shell/ls-colors-terminomancy.sh", "w")
if f then
    f:write(ls_colors)
    f:close()
    print("✓ Generated shell/ls-colors-terminomancy.sh")
end

-- Write Foot terminal config
os.execute("mkdir -p foot")
local foot_config = generate_foot_config()
f = io.open("foot/foot.ini", "w")
if f then
    f:write(foot_config)
    f:close()
    print("✓ Generated foot/foot.ini")
end

-- Write Sway colors
os.execute("mkdir -p sway")
local sway_colors = generate_sway_colors()
f = io.open("sway/colors", "w")
if f then
    f:write(sway_colors)
    f:close()
    print("✓ Generated sway/colors")
end

print("\n✨ All configs generated successfully!")
print("Note: README_PALETTE.md contains the palette table to merge into README.md")