import os

from libqtile import layout, bar, widget
from libqtile.command import lazy
from libqtile.config import (
    Key, Screen, Group, Match, Drag, Click
)


def on_stop(qtile):
    qtile.cmd_spawn('''
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify
            /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
    ''')


def on_prev(qtile):
    qtile.cmd_spawn('''
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify
            /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
    ''')


def on_play_pause(qtile):
    qtile.cmd_spawn('''
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify
            /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
    ''')


def on_next(qtile):
    qtile.cmd_spawn('''
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify
            /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
    ''')


def mixer(qtile, arg):
    mixer = os.path.join(
        os.path.dirname(__file__), 'mixer'
    )

    qtile.cmd_spawn(
        'sh {} {}'.format(mixer, arg)
    )


def on_mute(qtile):
    mixer(qtile, 'toggle-mute')


def on_lower_volume(qtile):
    mixer(qtile, 'lower-volume')


def on_raise_volume(qtile):
    mixer(qtile, 'raise-volume')


mod = 'mod1'

keys = [
    Key([mod], 'Return', lazy.spawn('gnome-terminal')),

    # Launch system command prompt
    Key([mod], 'p', lazy.spawncmd()),

    # Launch Qtile command prompt
    Key([mod], 'o', lazy.qtilecmd()),

    # Cycle through configured layouts
    Key([mod], 'space', lazy.next_layout()),

    # Manage floating clients
    Key([mod, 'shift'], 'space', lazy.window.toggle_floating()),

    # Toggle between maximized and tiled (in stack)
    Key([mod], 't', lazy.layout.toggle_split()),

    # Focus clients through movements
    Key([mod], 'k', lazy.layout.up()),
    Key([mod], 'j', lazy.layout.down()),
    Key([mod], 'h', lazy.layout.left()),
    Key([mod], 'l', lazy.layout.right()),

    # Move clients through movements
    Key([mod, 'shift'], 'j', lazy.layout.shuffle_down()),
    Key([mod, 'shift'], 'k', lazy.layout.shuffle_up()),
    Key([mod, 'shift'], 'h', lazy.layout.shuffle_left()),
    Key([mod, 'shift'], 'l', lazy.layout.shuffle_right()),

    # Resize clients/stacks through movements
    Key([mod, 'control'], 'h', lazy.layout.grow_left()),
    Key([mod, 'control'], 'l', lazy.layout.grow_right()),
    Key([mod, 'control'], 'k', lazy.layout.grow()),
    Key([mod, 'control'], 'j', lazy.layout.shrink()),

    # Lock screen
    # Key([mod, 'shift'], 'l', lazy.spawn('slock')),

    Key([], 'XF86AudioStop', lazy.function(on_stop)),
    Key([], 'XF86AudioPrev', lazy.function(on_prev)),
    Key([], 'XF86AudioPlay', lazy.function(on_play_pause)),
    Key([], 'XF86AudioNext', lazy.function(on_next)),

    Key([], 'XF86AudioMute', lazy.function(on_mute)),
    Key([], 'XF86AudioLowerVolume', lazy.function(on_lower_volume)),
    Key([], 'XF86AudioRaiseVolume', lazy.function(on_raise_volume)),

    # Kill focused client
    Key([mod, 'shift'], 'w', lazy.window.kill()),

    # Restart window manager
    Key([mod, 'shift'], 'r', lazy.restart()),

    # Kill window manager
    Key([mod, 'shift'], 'q', lazy.shutdown()),
]

groups = [
    Group('a'),
    Group('s'),
    Group('d'),
    Group('f', matches=[
        Match(wm_class=['Spotify'])
    ])
]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter = switch to & move focused window to group
        Key([mod, 'shift'], i.name, lazy.window.togroup(i.name)),
    ])

border_focus = '6666f8'
border_focus_stack = 'f85521'


floating_layout = layout.Floating(
    float_rules=[
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
    ],
    border_focus=border_focus,
    border_width=2,
)

layouts = [
    layout.Wmii(
        name='@wmii',
        margin=5,
        border_focus=border_focus,
        border_focus_stack=border_focus_stack,
        border_width=2,

    ),
    layout.MonadWide(
        name='@monad-w',
        margin=5,
        border_focus=border_focus,
        border_width=2,
    ),
    layout.MonadTall(
        name='@monad-t',
        margin=5,
        border_focus=border_focus,
        border_width=2,
    )
]

widget_defaults = dict(
    font='Monospace',
    fontsize=12,
    padding=3,
)

extension_defaults = widget_defaults.copy()

graph_defaults = dict(
    border_width=0
)

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.Wallpaper(
                    label='%',
                    random_selection=True,
                    directory=os.path.expanduser(
                        '~/Pictures/wallpapers/'
                    )
                ),
                widget.GroupBox(
                    highlight_method='block'
                ),
                widget.CurrentLayout(),
                widget.Prompt(),
                widget.Spacer(),
                widget.Pomodoro(),
                widget.Clock(
                    format='%Y-%m-%d %H:%M'
                )
            ],
            24
        )
    )
]

mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []

follow_mouse_focus = True
bring_front_click = True

cursor_warp = False

auto_fullscreen = True

focus_on_window_activation = 'smart'

wmname = 'LG3D'

main = None
