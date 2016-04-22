#!/bin/bash

details=$(xprop)

PID=$(echo "$details" | grep WM_PID | awk '{print $3}')	
if [ "$PID" == "" ]; then
	TEMPA=$(echo "$details" | grep 'WM_NAME(STRING)' | awk '{print $3}')
	TEMP=$(echo "$TEMPA" | tr -d '"')
	PID=$(ps aux | grep "$TEMP" | grep -v -e grep | grep -m 1 "$TEMP" |awk '{print $2}')
fi
NAME=$(ps aux | grep -v grep | grep $PID | awk '{for(i=11;i<=NF;++i)print $i}' )
pkill -STOP $NAME


