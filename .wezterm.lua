-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 18

config.font = wezterm.font_with_fallback {
  'Moralerspace Neon',
}

-- カラースキームを定義
config.colors = {
  foreground = "#c8d4f4",
  background = "#172233",

  ansi = {
    "#172233",  -- black
    "#ff6b7d",  -- red
    "#b3e699",  -- green
    "#ffcd3c",  -- yellow
    "#8aadf4",  -- blue
    "#f2bde0",  -- magenta
    "#9be3c3",  -- cyan
    "#b0bcdd",  -- white
  },

  brights = {
    "#515151",  -- bright black
    "#ff8787",  -- bright red
    "#69d97f",  -- bright green
    "#ffe066",  -- bright yellow
    "#85e89d",  -- bright blue
    "#e5a8ff",  -- bright magenta
    "#56d9d6",  -- bright cyan
    "#ffffff",  -- bright white
  },

  cursor_bg = "#f4d7d2",
  cursor_border = "#f4d7d2",
  cursor_fg = "#172233",

  selection_bg = "#304766",
  selection_fg = "#c8d4f4",

  tab_bar = {
    background = "#172233",
    active_tab = {
      bg_color = "#b3e699",
      fg_color = "#172233",
    },
    inactive_tab = {
      bg_color = "#172233",
      fg_color = "#838cab",
    },
    inactive_tab_hover = {
      bg_color = "#304766",
      fg_color = "#c8d4f4",
    },
    new_tab = {
      bg_color = "#172233",
      fg_color = "#838cab",
    },
    new_tab_hover = {
      bg_color = "#304766",
      fg_color = "#c8d4f4",
    },
  },
}

-- Finally, return the configuration to wezterm:
return config
