#!/bin/bash

tmp_file="/tmp/_prev_cpu_stats.txt"

function cpu_usage() {
    stats=$(cat /proc/stat | grep cpu | head -n1)
    read cpuname f1 f2 f3 idle f4 f5 f6 f7 f8 f9 <<< $stats

    total=$((f1 + f2 + f3 + idle + f4 + f5 + f6 + f7 + f8 + f9))
    busy=$((total - idle))

    prev_stat=$(cat $tmp_file)
    read prev_busy prev_total <<< $prev_stat

    echo "$busy $total" > $tmp_file

    diff_busy=$((busy - prev_busy))
    diff_total=$((total - prev_total))
    printf %2.f\\n "$((100 * diff_busy / diff_total))"
}

# requires lm-sensors
function cpu_thermal() {
    sensors | grep 'Package id 0' | sed -r 's/.*Package id 0:  \+([0-9\.]+)°C.*/\1°C/'
}

echo "$(cpu_usage)% $(cpu_thermal)"
