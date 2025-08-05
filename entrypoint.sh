#!/bin/bash

set -e

trap ctrl_c INT
function ctrl_c() {
  exit 0
}

rm /tmp/.X1-lock 2> /dev/null &
websockify -D --web=/usr/share/novnc/ localhost:$NO_VNC_PORT localhost:$VNC_PORT &
/usr/bin/Xvfb $DISPLAY -screen 0 ${VNC_RESOLUTION}x${VNC_COL_DEPTH} &
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION -SecurityTypes None -localhost no --I-KNOW-THIS-IS-INSECURE &
nginx -c /etc/nginx/nginx.conf &
wait 10
firefox &
wait

