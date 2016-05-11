gnome_session=$(pgrep -u $USER gnome-session)
eval export $(sed 's/\o000/\n/g;' < /proc/$gnome_session/environ | grep DISPLAY)
eval export $(sed 's/\o000/\n/g;' < /proc/$gnome_session/environ | grep XAUTHORITY)
eval export $(sed 's/\o000/\n/g;' < /proc/$gnome_session/environ | grep DBUS_SESSION_BUS_ADDRESS)

