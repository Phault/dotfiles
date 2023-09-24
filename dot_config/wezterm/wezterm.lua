local wezterm = require("wezterm")
local astro_dark = require("astro_dark")
local keys = require("keys")
local os_specific = require("os_specific")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
-- default bold uses semi-bold, which is barely different to regular
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "JetBrainsMonoNL Nerd Font",
			weight = "ExtraBold",
			italic = false,
		}),
	},

	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMonoNL Nerd Font",
			weight = "ExtraBold",
			italic = true,
		}),
	},
}

config.font_size = 13.0
config.line_height = 1.2
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.check_for_updates = false
config.audible_bell = "Disabled"
config.keys = keys
config.color_schemes = {
	["AstroDark"] = astro_dark,
}
config.color_scheme = "AstroDark"
config.use_fancy_tab_bar = false
config.window_frame = {
	-- only affects fancy tab bar
	font_size = 13.0,
	active_titlebar_bg = astro_dark.tab_bar.background,

	border_top_height = 20,
	border_left_width = 20,
	border_right_width = 20,
	border_bottom_height = 20,
	border_top_color = astro_dark.tab_bar.background,
	border_left_color = astro_dark.tab_bar.background,
	border_right_color = astro_dark.tab_bar.background,
	border_bottom_color = astro_dark.tab_bar.background,
}
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0cell",
	bottom = "0cell",
}

return os_specific(config)
