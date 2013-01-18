#!/bin/sh

#
# scratchpad.sh - Mimics ion's *scratchpad* feature
#
# This program makes it easy to start or show a window. I personally bind this
# script to "Alt+Space" and bind my window manager's iconify feature to
# "Alt+i" so that it is very quick to use. This is ideal to keep a todo list or
# a terminal at hand.
#
# Note: in a previous version of scratchpad I was sending "Alt+i" to the window
# manager using xdotool's key command but this has proven to be very buggy.
#
# Dependencies: xdotool
#

TMPFILE="/tmp/scratchpad.`id -u`"
COMMAND="gnome-terminal"

if [ -f $TMPFILE ]; then
    WINDOW=`cat $TMPFILE`
    DESKTOP=`xdotool get_desktop`

    xdotool set_desktop_for_window $WINDOW $DESKTOP
    xdotool windowmap $WINDOW
    xdotool windowfocus $WINDOW

    ACTIVE=`xdotool getactivewindow`

    if [ ! "$WINDOW" = "$ACTIVE" ]; then
        $COMMAND
        xdotool getactivewindow > $TMPFILE
    fi
else
    $COMMAND
    xdotool getactivewindow > $TMPFILE
fi
