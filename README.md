# Terminomancy

A dark color scheme for terminal-based development environments. 

A reinterpretation of [sourcerer](https://github.com/xero/sourcerer) by xero harrison, based on sorcerer by Jeet Sukumaran, based on mustang by Henrique C. Alves.

## Supported Tools

- **tmux**
- **Neovim**  
  - Tree-sitter
  - Language Server Protocol (LSP)
- Terminal emulators:
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

## Palette

| Name       | Hex       | Usage                    |
|------------|-----------|--------------------------|
| bg         | `#222222` | Background               |
| bg_dark    | `#1a1a1a` | Darker background        |
| bg_light   | `#2d2d2d` | Lighter background       |
| fg         | `#c2c2b0` | Foreground               |
| fg_dim     | `#949482` | Dimmed text              |
| comment    | `#686858` | Comments                 |
| string     | `#779b70` | Strings                  |
| func       | `#faf4c6` | Functions                |
| keyword    | `#90b0d1` | Keywords                 |
| type       | `#7e8aa2` | Types                    |
| constant   | `#ff9800` | Constants, booleans      |
| number     | `#cc8800` | Numbers                  |
| identifier | `#9ebac2` | Identifiers, parameters  |
| special    | `#719611` | Special characters       |
| preproc    | `#528b8b` | Preprocessor             |
| accent     | `#ff9800` | Accent color             |
| error      | `#ff6a6a` | Errors                   |
| warning    | `#ff9800` | Warnings                 |
| info       | `#4f94cd` | Info                     |
| hint       | `#2e8b57` | Hints                    |
| diff_add   | `#3cb371` | Added lines              |
| diff_del   | `#aa4450` | Deleted lines            |
| diff_change| `#4f94cd` | Changed lines            |

## License

MIT
