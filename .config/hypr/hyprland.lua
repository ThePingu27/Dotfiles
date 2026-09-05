--[[
--  Hyprland Configuration
--]]

require("config.monitor")
require("config.autostart")
require("config.environment")
require("config.aesthetics")
require("config.input")
require("config.keybindings")
require("config.window_rules")

--[[
--  Plugins
--]]

package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")

smw.setup({
	-- split monitor workpaces (smw) settings
	workspace_count = 5,
	monitor_priority = { "DP-1", "HDMI-A-1" },
	keep_focused = true,
	enable_notifcations = false,
	enable_persistent_workspaces = true,
	enable_wrapping = true,
	link_monitors = false,
})

local mainMod = "SUPER"
for i = 1, smw.get_amount_of_workspaces() do
	local n = tostring(i)
	if n == "10" then
		n = "0"
	end -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
	-- Switch to the Nth workspace on the currently focused monitor.
	hl.bind(mainMod .. " +" .. n, smw.workspace(n))
	-- Move the active window to the Nth workspace on the currently focused monitor silently (no focus change).
	hl.bind(mainMod .. " + SHIFT +" .. n, smw.move_to_workspace_silent(n))
end

hl.bind(mainMod .. " + tab", smw.cycle_workspaces("next"))

--[[
--  Ecosystem
--]]

hl.config({
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
		enforce_permissions = false,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		focus_on_activate = false,
	},
})
