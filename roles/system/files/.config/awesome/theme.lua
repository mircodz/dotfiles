local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme                                     = {}

theme.dir       = os.getenv("HOME") .. "/.config/awesome"
theme.wallpaper = theme.dir .. "/wallpaper.jpg"
theme.font      = "SF Mono 14"

theme.taglist_squares_sel   = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"

theme.fg_normal = "#DDDDFF"
theme.fg_focus  = "#AB4642"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#1A1A1A"
theme.bg_focus  = "#313131"
theme.bg_urgent = "#1A1A1A"

theme.tasklist_bg_focus = "#333333"

theme.border_width = dpi(5)

theme.border_normal      = "#3F3F3F"
theme.border_focus       = "#AB4642"
theme.border_marked      = "#CC9393"

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon    = false
theme.useless_gap              = 0

return theme
