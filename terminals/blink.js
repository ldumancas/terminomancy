// Terminomancy theme for Blink.sh
//
// Installation:
// 1. Open Blink Settings > Appearance > Themes
// 2. Tap + to add new theme
// 3. Paste this entire file content

black       = '#222222';
red         = '#aa4450';
green       = '#779b70';
yellow      = '#ff9800';
blue        = '#90b0d1';
magenta     = '#8f6f8f';
cyan        = '#528b8b';
white       = '#c2c2b0';

lightBlack   = '#686858';
lightRed     = '#ff6a6a';
lightGreen   = '#3cb371';
lightYellow  = '#cc8800';
lightBlue    = '#4f94cd';
lightMagenta = '#9ebac2';
lightCyan    = '#719611';
lightWhite   = '#faf4c6';

foregroundColor = '#c2c2b0';
backgroundColor = '#222222';
cursorColor     = '#ff9800';

t.prefs_.set('color-palette-overrides', [
    black, red, green, yellow, blue, magenta, cyan, white,
    lightBlack, lightRed, lightGreen, lightYellow,
    lightBlue, lightMagenta, lightCyan, lightWhite
]);

t.prefs_.set('foreground-color', foregroundColor);
t.prefs_.set('background-color', backgroundColor);
t.prefs_.set('cursor-color', cursorColor);
