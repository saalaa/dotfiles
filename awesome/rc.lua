-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local af = require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")

-- Extra widgets
local vicious = require("vicious")

if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

do
  local in_error = false

  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then
      return
    end

    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    })

    in_error = false
  end)
end

beautiful.init(
  gears.filesystem.get_configuration_dir() .. "themes/impressive/theme.lua"
)

modkey = "Mod1"

awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile.right,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.magnifier,
    awful.layout.suit.max,
}

local function set_wallpaper(s)
  if beautiful.wallpaper then
    gears.wallpaper.maximized(beautiful.wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

w_clock = wibox.widget {
  {
    widget = wibox.widget.textclock,
    format = '%A, %B %d <b>%H:%M</b>',
  },
  widget = wibox.container.background
}

w_keyboard = awful.widget.keyboardlayout()

w_layout = awful.widget.layoutbox(s)
w_layout:buttons(
  gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  )
)

w_volume = wibox.widget.textbox()

vicious.register(w_volume, vicious.widgets.volume, "vol. $1% |", 1, "Master")

awful.screen.connect_for_each_screen(function(s)
  -- XXX Ideally, only the main screen would get tags and a bar; other screens
  -- should be fullscreen or tiled with a sensible gap.

  set_wallpaper(s)

  awful.tag({ "A", "S", "D", "F" }, s, awful.layout.layouts[2])

  if s == screen.primary then
    s.panel = awful.wibar({
      position = "bottom",
      screen = s,
      height = 30,
    })

    s.panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
          left = 20,
          widget = wibox.container.margin,
          {
            w_clock,
            layout = wibox.layout.fixed.horizontal,
          }
        },
        { -- Middle widget
          layout = wibox.layout.fixed.horizontal
        },
        { -- Right widgets
          right = 20,
          widget = wibox.container.margin,
          {
            w_volume,
            w_keyboard,
            w_layout,
            -- wibox.widget.systray(),
            layout = wibox.layout.fixed.horizontal
          }
        }
    }
  end
end)

globalkeys = gears.table.join(

  awful.key(
    { modkey }, "Return",
    function ()
      awful.spawn("alacritty")
    end,
    {
      description = "open a terminal",
      group = "launcher"
    }
  ),

  awful.key(
    { modkey }, "p",
    function()
      awful.spawn("dmenu_run")
    end,
    {
      description = "show the menu",
      group = "launcher"
    }
  ),

  awful.key(
    { modkey }, "l",
    function()
      awful.spawn("i3lock -c 000000")
    end,
    {
      description = "show the menu",
      group = "launcher"
    }
  ),

  awful.key(
    { modkey, "Shift" }, "r",
    awesome.restart,
    {
      description = "reload awesome",
      group = "awesome"
    }
  ),

  awful.key(
    { modkey, "Shift" }, "q",
    awesome.quit,
    {
      description = "quit awesome",
      group = "awesome"
    }
  ),

  -- Layout cycling

  awful.key(
    { modkey }, "z",
    function ()
      awful.layout.set(awful.layout.suit.floating)
    end,
    {
      description = "set layout to floating",
      group = "layout"
    }
  ),

  awful.key(
    { modkey }, "x",
    function ()
      awful.layout.set(awful.layout.suit.tile.right)
    end,
    {
      description = "set layout to tile.right",
      group = "layout"
    }
  ),

  awful.key(
    { modkey }, "c",
    function ()
      awful.layout.set(awful.layout.suit.spiral.dwindle)
    end,
    {
      description = "set layout to spiral.dwindle",
      group = "layout"
    }
  ),

  awful.key(
    { modkey }, "v",
    function ()
      awful.layout.set(awful.layout.suit.magnifier)
    end,
    {
      description = "set layout to magnifier",
      group = "layout"
    }
  ),

  awful.key(
    { modkey }, "b",
    function ()
      awful.layout.set(awful.layout.suit.max)
    end,
    {
      description = "set layout to max",
      group = "layout"
    }
  ),

  --

  awful.key(
    { modkey }, "j",
    function ()
        awful.client.focus.byidx(1)
    end,
    {
      description = "focus next by index",
      group = "client"
    }
  ),

  awful.key(
    { modkey }, "k",
    function ()
      awful.client.focus.byidx(-1)
    end,
    {
      description = "focus previous by index",
      group = "client"
    }
  ),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program

    awful.key(
      { modkey }, "-",
      function ()
        awful.tag.incmwfact(-0.05)
      end,
      {
        description = "decrease master width factor",
        group = "layout"
      }
    ),

    awful.key(
      { modkey }, "=",
      function ()
        awful.tag.incmwfact(0.05)
      end,
      {
        description = "increase master width factor",
        group = "layout"
      }
    ),

  --

  awful.key(
    { }, "XF86AudioStop",
    function ()
      awful.spawn(
        gears.filesystem.get_configuration_dir() .. "audio stop"
      )
    end,
    {
      description = "mute/unmute volume",
      group = "launcher"
    }
  ),

  awful.key(
    { }, "XF86AudioPrev",
    function ()
      awful.spawn(
        gears.filesystem.get_configuration_dir() .. "audio previous"
      )
    end,
    {
      description = "mute/unmute volume",
      group = "launcher"
    }
  ),

  awful.key(
    { }, "XF86AudioPlay",
    function ()
      awful.spawn(
        gears.filesystem.get_configuration_dir() .. "audio play-pause"
      )
    end,
    {
      description = "mute/unmute volume",
      group = "launcher"
    }
  ),

  awful.key(
    { }, "XF86AudioNext",
    function ()
      awful.spawn(
        gears.filesystem.get_configuration_dir() .. "audio next"
      )
    end,
    {
      description = "mute/unmute volume",
      group = "launcher"
    }
  ),

  awful.key(
    { }, "XF86AudioMute",
    function ()
      awful.spawn(
        gears.filesystem.get_configuration_dir() .. "audio toggle-mute"
      )
    end,
    {
      description = "mute/unmute volume",
      group = "launcher"
    }
  ),

  awful.key(
    { }, "XF86AudioLowerVolume",
    function ()
      awful.spawn(
        gears.filesystem.get_configuration_dir() .. "audio lower-volume"
      )
    end,
    {
      description = "lower volume",
      group = "launcher"
    }
  ),

  awful.key(
    { }, "XF86AudioRaiseVolume",
    function ()
      awful.spawn(
        gears.filesystem.get_configuration_dir() .. "audio raise-volume"
      )
    end,
    {
      description = "raise volume",
      group = "launcher"
    }
  )

)

clientkeys = gears.table.join(
  awful.key(
    { modkey, "Shift" }, "c",
    function (c)
      c:kill()
    end,
    {
      description = "close",
      group = "client"
    }
  ),

  awful.key(
    { modkey, "Shift" }, "space",
    awful.client.floating.toggle,
    {
      description = "toggle floating",
      group = "client"
    }
  ),

  ---

  awful.key(
    { modkey, "Control" }, "f",
    function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {
      description = "toggle fullscreen",
      group = "client"
    }
  ),

  awful.key(
    { modkey, "Control" }, "Return",
    function (c)
      c:swap(awful.client.getmaster())
    end,
    {
      description = "move to master",
      group = "client"
    }
  )
)

globalkeys = gears.table.join(globalkeys,
  awful.key(
    { modkey }, "a",
    function ()
      local screen = awful.screen.focused()
      local tag = screen.tags[1]
      if tag then
        tag:view_only()
      end
    end,
    {
      description = "view tag A",
      group = "tag"
    }
  ),

  awful.key(
    { modkey, "Shift" }, "a",
    function ()
      if client.focus then
        local tag = client.focus.screen.tags[1]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
    {
      description = "move client to tag A",
      group = "tag"
    }
  ),

  awful.key(
    { modkey }, "s",
    function ()
      local screen = awful.screen.focused()
      local tag = screen.tags[2]
      if tag then
        tag:view_only()
      end
    end,
    {
      description = "view tag S",
      group = "tag"
    }
  ),

  awful.key(
    { modkey, "Shift" }, "s",
    function ()
      if client.focus then
        local tag = client.focus.screen.tags[2]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
    {
      description = "move client to tag S",
      group = "tag"
    }
  ),

  awful.key(
    { modkey }, "d",
    function ()
      local screen = awful.screen.focused()
      local tag = screen.tags[3]
      if tag then
        tag:view_only()
      end
    end,
    {
      description = "view tag D",
      group = "tag"
    }
  ),

  awful.key(
    { modkey, "Shift" }, "d",
    function ()
      if client.focus then
        local tag = client.focus.screen.tags[3]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
    {
      description = "move client to tag D",
      group = "tag"
    }
  ),

  awful.key(
    { modkey }, "f",
    function ()
      local screen = awful.screen.focused()
      local tag = screen.tags[4]
      if tag then
        tag:view_only()
      end
    end,
    {
      description = "view tag F",
      group = "tag"
    }
  ),

  awful.key(
    { modkey, "Shift" }, "f",
    function ()
      if client.focus then
        local tag = client.focus.screen.tags[4]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
    {
      description = "move client to tag F",
      group = "tag"
    }
  )
)


clientbuttons = gears.table.join(
  awful.button({ }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
  end),
  awful.button({ modkey }, 1, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function (c)
    c:emit_signal("request::activate", "mouse_click", {raise = true})
    awful.mouse.client.resize(c)
  end)
)

-- Set global keybindings
root.keys(globalkeys)

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}

-- Prevent clients from being unreachable after screen count changes.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("request::titlebars", function(c)
  local buttons = gears.table.join(
    awful.button({ }, 1, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.move(c)
    end),
    awful.button({ }, 3, function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.resize(c)
    end)
  )

  awful.titlebar(c, {position = "bottom", size = 2})

  awful.titlebar(c, {position = "top", size = 28}) : setup {
    { -- Left
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      {
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      {
        awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.closebutton(c),
        layout = wibox.layout.fixed.horizontal()
      },
      widget = wibox.container.margin,
      right = 5
    },
    layout = wibox.layout.align.horizontal
  }
end)

client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)
