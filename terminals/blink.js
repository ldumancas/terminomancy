// Terminomancy color scheme for Blink.sh
// Generated from palette.lua

black = '#222222';
red = '#aa4450';
green = '#779b70';
yellow = '#e6952a';
blue = '#8888cc';
magenta = '#8f6f8f';
cyan = '#528b8b';
white = '#c2c2b0';
lightBlack = '#8a8a78';
lightRed = '#ff6a6a';
lightGreen = '#3cb371';
lightYellow = '#cc8800';
lightBlue = '#4f94cd';
lightMagenta = '#70b8b8';
lightCyan = '#719611';
lightWhite = '#faf4c6';

background = '#222222';
foreground = '#c2c2b0';
cursor = '#e6952a';

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
