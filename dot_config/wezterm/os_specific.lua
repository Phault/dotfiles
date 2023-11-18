local wezterm = require("wezterm")

return function(config)
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		config.default_prog = { "powershell.exe", "-NoLogo" }
		config.font_size = 10

		-- the integrated decorations really don't work well on windows
		config.window_decorations = "TITLE | RESIZE"
	end

	return config
end
