local wezterm = require("wezterm")

local function BaseName(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local HEADER = "    "
local SYMBOL_COLOR = "#ffdc2e"
local FONT_COLOR = { "#dddddd", "#888888" }
local BACK_COLOR = { "#191919", "#333333" }

local config = {
	font_size = 8,
	font = wezterm.font("HackGen35 Console NF"),

	window_background_opacity = 0.9,
	window_decorations = "NONE",
	window_frame = {
		font_size = 10.0,
	},
	window_padding = {
		left = 16,
		right = 16,
		top = 12,
		bottom = 0,
	},

	use_fancy_tab_bar = true,

	wezterm.on("format-tab-title", function(tab)
		local index = tab.is_active and 1 or 2
		return {
			{ Foreground = { Color = SYMBOL_COLOR } },
			{ Background = { Color = BACK_COLOR[index] } },
			{ Text = HEADER },

			{ Foreground = { Color = FONT_COLOR[index] } },
			{ Background = { Color = BACK_COLOR[index] } },
			{ Text = tab.active_pane.title },
		}
	end),

	wezterm.on("format-window-title", function(tab)
		return BaseName(tab.active_pane.foreground_process_name)
	end),
}

return config
