local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- Default shell.
config.default_prog = { '/opt/homebrew/bin/fish' }

-- Appearance.
config.color_scheme       = 'Catppuccin Mocha'
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

config.font        = wezterm.font('Iosevka Custom' , { weight = 'Medium' })
config.font_size   = 14.5
config.line_height = 1.1

config.default_cursor_style = "SteadyBar"

-- Key bindings.
config.disable_default_key_bindings = true
config.keys = {
  { action = act.QuitApplication,       key = 'q', mods = 'SUPER' },
  { action = act.CopyTo 'Clipboard',    key = 'c', mods = 'SUPER' },
  { action = act.PasteFrom 'Clipboard', key = 'v', mods = 'SUPER' },
}

return config
