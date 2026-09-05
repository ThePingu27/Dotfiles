------------------------------------------------------------
-- Autostart
------------------------------------------------------------

local scripts = "$HOME/.config/hypr/scripts"

hl.on("hyprland.start", function()
	hl.exec_cmd(scripts .. "/Wallpaper.sh")
	hl.exec_cmd("waybar")
	hl.exec_cmd("kitty")
	hl.exec_cmd("hyprctl reload")
end)
