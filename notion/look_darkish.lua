-- look_darkish.lua: An ion3 style for beautiful screens like mine (:
-- Based on look_tiny.lua itself based on look_minimalist.lua

if not gr.select_engine("de") then return end

local bg_color    = "#000000";
local bg_no_color = "#222222";
local bg_hi_color = "#333333";
local fg_no_color = "#888888";
local fg_hi_color = "#ffffff";

de.reset()

de.defstyle("*", {
    bar_inside_border = false,
    background_colour = bg_color,
    foreground_colour = fg_no_color,
    padding_colour = bg_hi_color,
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "ridge",
    font = "-*-Droid Sans Mono-medium-r-normal-*-10-*-*-*-*-*-*-*",
    text_align = "left",
    transparent_background = false,
})

de.defstyle("frame", {
    based_on = "*",
    spacing = 2,
})

de.defstyle("frame-floating", {
    based_on = "frame",
    highlight_colour = bg_no_color,
    shadow_colour = bg_no_color,
})

de.defstyle("tabstyle", {
    based_on = "*",
    background_colour = bg_no_color,
    de.substyle("active-unselected", {
            padding_colour = bg_no_color,
            background_colour = bg_no_color,
            foreground_colour = fg_no_color,
    }),
    de.substyle("inactive-selected", {
            padding_colour = bg_hi_color,
            background_colour = bg_hi_color,
            foreground_colour = fg_no_color,
    }),
    de.substyle("active-selected", {
            padding_colour = bg_hi_color,
            background_colour = bg_hi_color,
            foreground_colour = fg_hi_color,
    }),
})

de.defstyle("tab", {
    based_on = "tabstyle",
    spacing = 2,
    padding_pixels = 1,
})

de.defstyle("tab-menuentry", {
    based_on = "tabstyle",
    text_align = "left",
})

de.defstyle("tab-menuentry-big", {
    based_on = "tab-menuentry",
})

de.defstyle("input", {
    based_on = "*",
    padding_pixels = 5,
    background_colour = bg_hi_color,
    de.substyle("*-cursor", {
        background_colour = bg_hi_color,
        foreground_colour = fg_no_color,
    }),
    de.substyle("*-selection", {
        foreground_colour = fg_hi_color,
    }),
})

de.defstyle("stdisp", {
    based_on = "tab",
    background_colour = bg_color,
    padding_colour = bg_color,
    de.substyle("important", { foreground_colour = "#ffff00", }),
    de.substyle("critical", { foreground_colour = "#ff0000", }),
    de.substyle("gray", { foreground_colour = "#505050", }),
    de.substyle("red", { foreground_colour = "#ff0000", }),
    de.substyle("green", { foreground_colour = "#00ff00", }),
    de.substyle("blue", { foreground_colour = "#0000ff", }),
    de.substyle("cyan", { foreground_colour = "#00ffff", }),
    de.substyle("magenta", { foreground_colour = "#ff00ff", }),
    de.substyle("yellow", { foreground_colour = "#ffff00", }),
})

gr.refresh()
