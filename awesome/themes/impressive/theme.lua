-- "impressive" awesome theme

local dir = require("gears.filesystem").get_configuration_dir()
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}

theme.useless_gap = dpi(15)

theme.wallpaper = dir .. "themes/impressive/wallpaper.jpg"

-- theme.font = "Noto Sans Display 9"
theme.font = "Noto Sans Mono 9"

theme.fg_normal = "#CDCDCD"
theme.fg_focus  = "#60687D"
theme.fg_urgent = "#F9F9F9"

theme.bg_normal = "#E7E8EB"
theme.bg_focus  = "#E7E8EB"
theme.bg_urgent = "#E89393"

theme.border_width  = dpi(0)
theme.border_normal = "#E7E8EBFF"
theme.border_focus  = "#E7E8EBDD"
theme.border_marked = "#E7E8EB"

theme.wibar_bg = "#00000066"
theme.wibar_fg = "#F9F9F9"

theme.mouse_finder_color = "#CC9393"

theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.titlebar_bg_normal = "#E7E8EBDD"
theme.titlebar_bg_focus  = "#E7E8EBFF"

theme.titlebar_close_button_focus  = dir .. "themes/impressive/titlebar/close_focus.png"
theme.titlebar_close_button_normal = dir .. "themes/impressive/pixel.png"

theme.titlebar_maximized_button_focus_active  = dir .. "themes/impressive/titlebar/maximized_focus.png"
theme.titlebar_maximized_button_normal_active = dir .. "themes/impressive/pixel.png"
theme.titlebar_maximized_button_focus_inactive  = dir .. "themes/impressive/titlebar/maximized_focus.png"
theme.titlebar_maximized_button_normal_inactive = dir .. "themes/impressive/pixel.png"

return theme
