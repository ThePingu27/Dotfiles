--[[
--  Environment
--]]

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Toolkit backed
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT specifications
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- Firefox
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Electron
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
