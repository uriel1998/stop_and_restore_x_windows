#!/bin/bash

NAME=($(wmctrl -l | awk '$2 != "-1"' | cut -d' ' -f 5-))
echo "$NAME"
read
for i in "$NAME[@]"; do 
	echo "$i"
	echo "booger"
	WINID=$(xdotool search --name --onlyvisible "$name")
	echo "$WINID"
	details=$(xprop -id "$WINID")	
	PID=$(echo "$details" | grep WM_PID | awk '{print $3}')	
	if [ "$PID" == "" ]; then
		TEMPA=$(echo "$details" | grep 'WM_NAME(STRING)' | awk '{print $3}')
		TEMP=$(echo "$TEMPA" | tr -d '"')
		PID=$(ps aux | grep "$TEMP" | grep -v -e grep | grep -m 1 "$TEMP" |awk '{print $2}')
	fi
	#NAME=$(ps aux | grep -v grep | grep $PID | awk '{for(i=11;i<=NF;++i)print $i}' )
	#pkill -STOP $NAME
done

exit
