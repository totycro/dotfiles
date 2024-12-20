local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'DejaVu Sans Mono'
config.font = wezterm.font 'Ubuntu Mono'
config.font = wezterm.font 'JetBrains Mono'
-- config.font_size = 13.5 -- big screen
config.font_size = 12 -- only laptop
-- config.font_size = 14
config.default_prog = { '/usr/bin/zsh' }
config.enable_tab_bar = false
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}
config.window_background_opacity = 0.96
config.window_decorations = "NONE"
-- config.color_scheme = 'Mariana' -- good, but can't read completion
config.color_scheme = 'Afterglow'
config.color_scheme = 'DanQing (base16)' -- bg a bit too dark
config.color_scheme = 'Nord (Gogh)' -- somewhat bluey
config.color_scheme = 'Nord Light (Gogh)'
config.color_scheme = 'aikofog (terminal.sexy)'
config.color_scheme = 'Muse (terminal.sexy)'
config.color_scheme = 'Nord (base16)' -- can't read completion well
config.color_scheme = 'Kanagawa (Gogh)'
config.color_scheme = 'Nova (base16)'  -- blue
config.color_scheme = 'Afterglow' -- hard to read completion
config.color_scheme = 'Obsidian'
config.color_scheme = 'Obsidian (Gogh)'
config.color_scheme = 'Ocean (base16)'
config.color_scheme = 'nord-light'
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.color_scheme = 'Afterglow (Gogh)' -- bg dark
return config
