------------------------------------------------------------
-- Keybindings
------------------------------------------------------------

local scripts = "$HOME/.config/hypr/scripts"
local mainMod = "SUPER"

local Variable = {
	terminal = "kitty",
	menu = "fuzzel",
	fileManager = "thunar",
	browser = "librewolf",
	docViewer = "okular",
}

-- Common program bindings

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(Variable.terminal))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(Variable.menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(Variable.fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(Variable.browser))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(Variable.docViewer))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(Variable.terminal .. " -e yazi"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(scripts .. "/Screenshot.sh"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(scripts .. "/Wallpaper.sh"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(Variable.terminal .. " -e nvim"))
hl.bind("CTRL + ALT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd(scripts .. "/Refresh.sh"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(scripts .. "/Hyprsunset.sh"))

-- Traversal keybindings

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(scripts .. "/KillActiveProcess.sh"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Window keybindings

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

local function smart_move(dx, dy, direction)
	return function()
		local w = hl.get_active_window()
		if not w then
			return
		end

		if w.floating then
			hl.dispatch(hl.dsp.window.move({
				x = dx,
				y = dy,
				relative = true,
			}))
		else
			hl.dispatch(hl.dsp.window.move({
				direction = direction,
			}))
		end
	end
end

hl.bind(mainMod .. " + SHIFT + left", smart_move(-15, 0, "left"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + H", smart_move(-15, 0, "left"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", smart_move(15, 0, "right"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", smart_move(15, 0, "right"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", smart_move(0, -15, "up"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", smart_move(0, -15, "up"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", smart_move(0, 15, "down"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", smart_move(0, 15, "down"), { repeating = true })

-- Scrolling keybindings
hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"))
