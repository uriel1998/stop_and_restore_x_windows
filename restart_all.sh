#!/bin/bash

NAME=$(ps aux | awk '$8 == "T"' | awk '{for(i=11;i<=NF;++i)print $i}')
for name in $NAME; do pkill -CONT $name; done

NAME=$(ps aux | awk '$8 == "Tl"' | awk '{for(i=11;i<=NF;++i)print $i}')
for name in $NAME; do pkill -CONT $name; done
