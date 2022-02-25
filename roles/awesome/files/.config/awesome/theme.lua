local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme                                     = {}

theme.dir       = os.getenv("HOME") .. "/.config/awesome"
theme.wallpaper = theme.dir .. "/wallpaper.jpg"
theme.font      = "SF Mono 12"

theme.fg_normal = "#DDDDFF"
theme.fg_focus  = "#AB4642"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#1A1A1A"
theme.bg_focus  = "#313131"
theme.bg_urgent = "#1A1A1A"

theme.tasklist_bg_focus = "#333333"

theme.border_width = dpi(2)

theme.border_normal      = "#3F3F3F"
theme.border_focus       = "#AB4642"
theme.border_marked      = "#CC9393"
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"

theme.titlebar_bg_focus  = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_focus
theme.titlebar_fg_focus  = theme.fg_focus

theme.menu_height = dpi(16)
theme.menu_width  = dpi(140)

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon    = false
theme.useless_gap              = 0

theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"

return theme
