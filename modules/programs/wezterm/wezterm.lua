local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	"UDEV Gothic NF",
	"Noto Sans CJK JP",
	"Noto Color Emoji",
})
config.font_size = 12.0

config.enable_wayland = true
config.use_ime = true

config.window_close_confirmation = "NeverPrompt"

return config
