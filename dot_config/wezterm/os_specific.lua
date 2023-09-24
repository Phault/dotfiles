local wezterm = require("wezterm")

return function(config)
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		config.default_prog = { "powershell.exe", "-NoLogo" }
		config.font_size = 10
	end

	return config
end
