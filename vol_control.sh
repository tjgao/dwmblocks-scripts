#!/bin/bash

val=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')

if (( $val == 0 )); then
    icon="ﱝ"
elif (( $val < 33 )); then
    icon="奄"
elif (( $val < 66)); then
    icon="奔"
elif (( $val < 100)); then
    icon="墳"
else
    icon=""
fi

padding=$(printf "% 4d" $val)
echo "$icon$padding%"
