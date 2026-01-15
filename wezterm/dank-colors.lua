-- Lua return table for WezTerm colors
-- DMS matugen template using dank16 palette (最適コントラスト)

local colors = {
  -- Base colors (Material You)
  foreground = "#cdd6f4",
  background = "#181825",

  ansi = {
    "#181825",  -- black
    "#e34b81",  -- red
    "#98d66e",  -- green
    "#dbac7b",  -- yellow
    "#be7040",  -- blue
    "#bb9076",  -- magenta
    "#fab387",  -- cyan
    "#abb2bf",  -- white
  },

  brights = {
    "#5c6370",  -- bright black
    "#e05f91",  -- bright red
    "#aae086", -- bright green
    "#e8c197", -- bright yellow
    "#ffc496", -- bright blue
    "#b36754", -- bright magenta
    "#987450", -- bright cyan
    "#ffffff", -- bright white
  },

  cursor_bg = "#fab387",
  cursor_border = "#fab387",
  cursor_fg = "#1e1e2e",

  selection_bg = "#734226",
  selection_fg = "#cdd6f4",

  tab_bar = {
    background = "#181825",
    active_tab = {
      bg_color = "#fab387",
      fg_color = "#1e1e2e",
    },
    inactive_tab = {
      bg_color = "#181825",
      fg_color = "#a6adc8",
    },
    new_tab = {
      bg_color = "#181825",
      fg_color = "#a6adc8",
    },
  },
};

return colors
