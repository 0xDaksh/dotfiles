##### IMPORTS #####
import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from typing import List  # noqa: F401

##### DEFINING SOME VARIABLES #####
mod = "mod4"  # Sets mod key to SUPER/WINDOWS
myTerm = "/home/daksh/.config/qtile/launch_terminal"  # My terminal of choice
myConfig = "/home/daksh/.config/qtile/config.py"  # The Qtile config file location

##### KEYBINDINGS #####
keys = [
    # The essentials
    Key([mod], "Return", lazy.spawn(myTerm), desc='Launches My Terminal'),
        desc='Dmenu Run Launcher'),
    Key([mod], "space", lazy.next_layout(), desc='Toggle through layouts'),
    Key([mod], "q", lazy.window.kill(), desc='Kill active window'),
    Key([mod, "shift"], "r", lazy.restart(), desc='Restart Qtile'),
    Key([mod, "shift"], "x", lazy.shutdown(), desc='Shutdown Qtile'),
    # Treetab controls
    Key([mod, "control"],
        "k",
        lazy.layout.section_up(),
        desc='Move up a section in treetab'),
    Key([mod, "control"],
        "j",
        lazy.layout.section_down(),
        desc='Move down a section in treetab'),
    # Window controls
    Key([mod],
        "k",
        lazy.layout.down(),
        desc='Move focus down in current stack pane'),
    Key([mod],
        "j",
        lazy.layout.up(),
        desc='Move focus up in current stack pane'),
    Key([mod, "shift"],
        "k",
        lazy.layout.shuffle_down(),
        desc='Move windows down in current stack'),
    Key([mod, "shift"],
        "j",
        lazy.layout.shuffle_up(),
        desc='Move windows up in current stack'),
    Key([mod],
        "h",
        lazy.layout.grow(),
        lazy.layout.increase_nmaster(),
        desc='Expand window (MonadTall), increase number in master pane (Tile)'
        ),
    Key([mod],
        "l",
        lazy.layout.shrink(),
        lazy.layout.decrease_nmaster(),
        desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
        ),
    Key([mod],
        "n",
        lazy.layout.normalize(),
        desc='normalize window size ratios'),
    Key([mod],
        "m",
        lazy.layout.maximize(),
        desc='toggle window between minimum and maximum sizes'),
    Key([mod], "t", lazy.window.toggle_floating(), desc='toggle floating'),
    # Stack controls
    Key([mod, "shift"],
        "c",
        lazy.layout.rotate(),
        lazy.layout.flip(),
        desc='Switch which side main pane occupies (XmonadTall)'),
    Key([mod],
        "Tab",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'),
    Key([mod, "control"],
        "Return",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'),
    Key([mod, "shift"],
        "s",
        lazy.spawn("flameshot gui"),
        desc='Take screenshot'),
    Key([],
        "XF86MonBrightnessUp",
        lazy.spawn("backlight +5%"),
        desc="backlight increase"),
    Key([],
        "XF86MonBrightnessDown",
        lazy.spawn("backlight -5%"),
        desc="backlight increase"),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 sset Master 1+ unmute")),
    Key([mod, "shift"], "Return", lazy.spawn("thunar")),
]

##### GROUPS #####
group_names = [("WWW", {
    'layout': 'monadtall'
}), ("DEV", {
    'layout': 'monadtall'
}), ("TERM", {
    'layout': 'monadtall'
}), ("SYS", {
    'layout': 'monadtall'
}), ("SRV", {
    'layout': 'monadtall'
}), ("MUS", {
    'layout': 'monadtall'
}), ("GFX", {
    'layout': 'monadtall'
}), ("VID", {
    'layout': 'monadtall'
}), ("DOC", {
    'layout': 'monadtall'
})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i),
                    lazy.group[name].toscreen()))  # Switch to another group
    keys.append(
        Key([mod, "shift"], str(i),
            lazy.window.togroup(name)))  # Send current window to another group

##### DEFAULT THEME SETTINGS FOR LAYOUTS #####
layout_theme = {
    "border_width": 2,
    "margin": 6,
    "border_focus": "e1acff",
    "border_normal": "1D2330"
}

##### THE LAYOUTS #####
layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    layout.TreeTab(font="JetBrainsMono Nerd Font Mono",
                   fontsize=14,
                   sections=["FIRST", "SECOND"],
                   section_fontsize=14,
                   bg_color="141414",
                   active_bg="90C435",
                   active_fg="000000",
                   inactive_bg="384323",
                   inactive_fg="a0a0a0",
                   padding_y=5,
                   section_top=10,
                   panel_width=320),
    layout.Floating(**layout_theme)
]

##### COLORS #####
colors = [
    ["#282a36", "#282a36"],  # panel background
    ["#434758", "#434758"],  # background for current screen tab
    ["#ffffff", "#ffffff"],  # font color for group names
    ["#ff5555", "#ff5555"],  # border line color for current tab
    ["#8d62a9", "#8d62a9"],  # border line color for other tab and odd widgets
    ["#668bd7", "#668bd7"],  # color for the even widgets
    ["#e1acff", "#e1acff"]
]  # window name

##### PROMPT #####
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(font="JetBrainsMono Nerd Font Mono",
                       fontsize=15,
                       padding=2,
                       background=colors[2])
extension_defaults = widget_defaults.copy()

##### WIDGETS #####


def init_widgets_list():
    widgets_list = [
        widget.Sep(linewidth=0,
                   padding=6,
                   foreground=colors[2],
                   background=colors[0]),
        widget.Image(
            filename="~/.config/qtile/icons/haskell.png",
            mouse_callbacks={
                'Button1':
                lambda qtile: qtile.cmd_spawn(
                    'rofi -modi run,drun -show drun -location 7 -xoffset 5 -yoffset -450 -line-padding 4 -columns 1 -width 20 -lines 10 -padding 25 -hide-scrollbar -show-icons -drun-icon-theme'
                )
            }),
        widget.Sep(linewidth=0,
                   padding=10,
                   foreground=colors[2],
                   background=colors[0]),
        widget.GroupBox(font="JetBrainsMono Nerd Font Mono",
                        fontsize=16,
                        margin_y=2,
                        margin_x=0,
                        padding_y=5,
                        padding_x=5,
                        borderwidth=3,
                        active=colors[2],
                        inactive=colors[2],
                        rounded=False,
                        highlight_color=colors[1],
                        highlight_method="line",
                        this_current_screen_border=colors[3],
                        this_screen_border=colors[4],
                        other_current_screen_border=colors[0],
                        other_screen_border=colors[0],
                        foreground=colors[2],
                        background=colors[0]),
        widget.Prompt(prompt=prompt,
                      font="JetBrainsMono Nerd Font Mono",
                      padding=10,
                      foreground=colors[3],
                      background=colors[1]),
        widget.Sep(linewidth=0,
                   padding=40,
                   foreground=colors[2],
                   background=colors[0]),
        widget.WindowName(foreground=colors[6],
                          background=colors[0],
                          padding=0),
        widget.TextBox(text=" BL:",
                       foreground=colors[2],
                       background=colors[4],
                       padding=0,
                       fontsize=14),
        widget.Backlight(foreground=colors[2],
                         background=colors[4],
                         padding=5,
                         backlight_name="intel_backlight",
                         brightness_file="brightness"),
        widget.TextBox(text=" BAT:",
                       foreground=colors[2],
                       background=colors[5],
                       padding=0),
        widget.Battery(foreground=colors[2], background=colors[5], padding=5),
        widget.TextBox(text=" MEM:",
                       foreground=colors[2],
                       background=colors[4],
                       padding=0,
                       fontsize=14),
        widget.Memory(foreground=colors[2],
                      background=colors[4],
                      mouse_callbacks={
                          'Button1':
                          lambda qtile: qtile.cmd_spawn(myTerm + ' -e ytop')
                      },
                      padding=5),
        widget.TextBox(text=" VOL:",
                       foreground=colors[2],
                       background=colors[5],
                       padding=0),
        widget.PulseVolume(foreground=colors[2],
                           background=colors[5],
                           padding=5),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[0],
            background=colors[4],
            padding=0,
            scale=0.7),
        widget.CurrentLayout(foreground=colors[2],
                             background=colors[4],
                             padding=5),
        widget.Clock(foreground=colors[2],
                     background=colors[5],
                     format="%a, %b %d [%H:%M]"),
        widget.Sep(linewidth=0,
                   padding=10,
                   foreground=colors[0],
                   background=colors[5]),
        widget.Systray(background=colors[0], padding=5),
    ]
    return widgets_list


# SCREENS #####


def init_screens():
    return [
        Screen(
            top=bar.Bar(widgets=init_widgets_list(), opacity=0.95, size=28)),
    ]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()

##### DRAG FLOATING WINDOWS #####
mouse = [
    Drag([mod],
         "Button1",
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod],
         "Button3",
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

##### FLOATING WINDOWS #####
floating_layout = layout.Floating(float_rules=[
    {
        'wmclass': 'confirm'
    },
    {
        'wmclass': 'dialog'
    },
    {
        'wmclass': 'download'
    },
    {
        'wmclass': 'error'
    },
    {
        'wmclass': 'file_progress'
    },
    {
        'wmclass': 'notification'
    },
    {
        'wmclass': 'splash'
    },
    {
        'wmclass': 'toolbar'
    },
    {
        'wmclass': 'confirmreset'
    },  # gitk
    {
        'wmclass': 'makebranch'
    },  # gitk
    {
        'wmclass': 'maketag'
    },  # gitk
    {
        'wname': 'branchdialog'
    },  # gitk
    {
        'wname': 'pinentry'
    },  # GPG key password entry
    {
        'wmclass': 'ssh-askpass'
    },  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"


##### STARTUP APPLICATIONS #####
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
