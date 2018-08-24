import os

from libqtile import layout, bar, widget
from libqtile.command import lazy
from libqtile.config import (
    Key, Screen, Group, Drag, Click
)

mod = "mod1"

keys = [
    Key([mod], "Return", lazy.spawn("gnome-terminal")),

    # Lock screen
    Key([mod, "control"], "l", lazy.spawn("slock")),

    # Launch arbitrary commands
    Key([mod], "p", lazy.spawncmd()),

    # Cycle through configured layouts
    Key([mod], "space", lazy.next_layout()),

    # Toggle between maximized and tiled (in stack)
    Key([mod, "shift"], "space", lazy.layout.toggle_split()),

    # Focus clients through movements
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    # Move clients through movements
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    # Manage floating clients
    Key([mod], "f", lazy.window.toggle_floating()),

    # Key([mod], "f", lazy.window.toggle_fullscreen()),
    # Key([mod], "m", lazy.window.toggle_minimize()),

    # Swap panes of split stack
    # Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Kill focused client
    Key([mod, "control"], "w", lazy.window.kill()),

    # Restart window manager
    Key([mod, "control"], "r", lazy.restart()),

    # Kill window manager
    Key([mod, "control"], "q", lazy.shutdown()),
]

groups = [Group(i) for i in "123456"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

layouts = [
    layout.Floating(name='f'),
    layout.Wmii(
        name='w', border_width=1, margin=5
    )
]

widget_defaults = dict(
    font='monospace',
    fontsize=12,
    padding=3,
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.Wallpaper(
                    label='@',
                    random_selection=True,
                    directory=os.path.expanduser(
                        '~/Pictures/wallpapers/'
                    )
                ),
                widget.CurrentLayout(),
                # widget.GroupBox(),
                widget.Prompt(),
                widget.Spacer(),
                widget.MemoryGraph(
                    border_width=0, line_width=1
                ),
                widget.CPUGraph(
                    border_width=0, line_width=1
                ),
                # widget.Systray(),
                widget.Clock(
                    format='%Y-%m-%d %H:%m'
                )
            ],
            24
        )
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []

main = None

follow_mouse_focus = True

bring_front_click = True

cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])

auto_fullscreen = True

focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
