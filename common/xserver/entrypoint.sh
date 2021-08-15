#!/bin/sh
nohup Xvfb "${DISPLAY}" &
x11vnc -forever -quiet
