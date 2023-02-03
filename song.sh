#!/bin/bash
SONG=$(/usr/bin/playerctl metadata xesam:title)
if [ ${#SONG} -lt 29 ]; then
	echo $SONG
else
	echo ${SONG:0:25}...
fi
