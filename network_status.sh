#!/bin/bash

function read_device() {
    last_read_time=0
    last_rx=0
    last_tx=0
    if test -f "/tmp/_last_read_$1.txt"; then
        read last_read_time last_rx last_tx <<< $(cat "/tmp/_last_read_$1.txt" | head -n1) 
    fi
    rx=$(cat /sys/class/net/$1/statistics/rx_bytes)
    tx=$(cat /sys/class/net/$1/statistics/tx_bytes)
    time=$(bc -l <<< "$(date +%s%N)/1000000000")
    time_diff=$(bc -l <<< "$time-$last_read_time")
    rx_rate=$(numfmt --to iec --format "%3.1f" $(bc -l <<< "($rx-$last_rx)/$time_diff"))
    tx_rate=$(numfmt --to iec --format "%3.1f" $(bc -l <<< "($tx-$last_tx)/$time_diff"))
    echo "$time $rx $tx" > "/tmp/_last_read_$1.txt"
    echo "$rx_rate $tx_rate"
}

result=""

while read device type state connection; do 
    if [[ $type = "ethernet" ]]; then
        if [[ $state = "connected" ]]; then
            result="$result "
        else
            result="$result "
        fi
        result="$result$(read_device $device) "
    fi
    if [[ $type = "wifi" ]]; then
        if [[ $state = "connected" ]]; then
            result="$result直"
        else
            result="$result睊"
        fi
        result="$result$(read_device $device) "
    fi
done <<< "$(nmcli device status)"

echo $result
