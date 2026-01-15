#!/bin/sh
notify-send "Restarting DMS..."
QT_QPA_PLATFORM=wayland dms restart
notify-send "DMS restarted"
