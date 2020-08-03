#!/bin/bash

if [[ $1 = "cpu" ]]; then
    data="$(top -b -n 1 -o +%CPU \
     | head -12 \
     | tail -6 \
     | awk -v OFS='\t' '{print $1, $9, $12}')"
else
    data="$(top -b -n 1 -o +%MEM \
     | head -12 \
     | tail -6 \
     | awk -v OFS='\t' '{print $1, $10, $12}')"
fi

echo "$data"
notify-send "TOP PROCESSES 🥵" \
            "$data" \
            -i process-stop

