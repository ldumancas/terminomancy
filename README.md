# Terminomancy

A dark color scheme for terminal-based development environments. 

A reinterpretation of [sourcerer](https://github.com/xero/sourcerer) by xero harrison, based on sorcerer by Jeet Sukumaran, based on mustang by Henrique C. Alves.

## Supported Tools

- **tmux**
- **Neovim**
  - Tree-sitter
  - Language Server Protocol (LSP)
- **Shell**
  - LS_COLORS / EZA_COLORS
  - Bat syntax highlighter
- **Terminal emulators:**
  - iTerm2
  - Blink.sh
  - Windows Terminal
  - macOS Terminal.app

## Installation

### tmux

Source the theme to your `~/.tmux.conf`:

```bash
source-file /path/to/terminomancy/tmux/terminomancy.conf
```

### Neovim

Add the colorscheme to your runtime path:

```bash
~/.config/nvim/colors/terminomancy.lua
```

Then in your config add:

```lua
vim.cmd("colorscheme terminomancy")
```
### Terminal emulators (untested)

#### Blink.sh 

- [Installation](https://github.com/blinksh/themes/tree/master?tab=readme-ov-file#blink-shell-themes)

#### Windows Terminal

- [Installation](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/themes)

#### macOS Terminal.app

- [Installation](https://support.apple.com/guide/terminal/profiles-change-terminal-windows-trml107/mac)

## Color Palette

All colors are defined in `palette.lua` as the single source of truth. Run `lua generate.lua` to regenerate all config files.

| Color | Hex | Usage |
|-------|-----|-------|
| bg | `#222222` | Background |
| bg_dark | `#1a1a1a` | Darker background |
| bg_light | `#2d2d2d` | Lighter background |
| fg | `#c2c2b0` | Foreground text |
| fg_dim | `#a0a08e` | Dimmed text |
| | | |
| comment | `#8a8a78` | Comments |
| string | `#779b70` | Strings |
| func | `#faf4c6` | Functions |
| keyword | `#8888cc` | Keywords |
| type | `#7e8aa2` | Types |
| constant | `#e6952a` | Constants |
| number | `#cc8800` | Numbers |
| identifier | `#70b8b8` | Identifiers |
| special | `#719611` | Special characters |
| preproc | `#528b8b` | Preprocessor |
| | | |
| selection | `#3a3a3a` | Selected text |
| linenr | `#929292` | Line numbers |
| match | `#fff000` | Matching brackets |
| search | `#d6e770` | Search highlights |
| | | |
| error | `#ff6a6a` | Errors |
| warning | `#e6952a` | Warnings |
| info | `#4f94cd` | Info |
| hint | `#2e8b57` | Hints |
| | | |
| diff_add | `#3cb371` | Added lines |
| diff_del | `#aa4450` | Deleted lines |
| diff_change | `#4f94cd` | Changed lines |
| diff_add_bg | `#2a3a2a` | Added background |
| diff_del_bg | `#3a2828` | Deleted background |
| diff_change_bg | `#28303a` | Changed background |
| diff_text_bg | `#3a4a5a` | Diff text background |
| | | |
| accent | `#e6952a` | Accent color |
| accent_dark | `#c4820a` | Dark accent |
| todo | `#8f6f8f` | TODO highlights |

## License

MIT
