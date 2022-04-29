#!/bin/bash

w=$(curl -s https://wttr.in/\?format\=\"%c:%C:%h:%t:%w:%p\" | tr -d '"')

IFS=":" read cond_icon condition humidity temperature wind precipitation <<< $w

result="$cond_icon $condition  $humidity 糖$temperature 煮$wind"

if [ $precipitation != "0.0mm" ]; then
    result="$result    $precipitation"
fi

echo $result
