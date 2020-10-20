#/bin/sh

for f in /sys/class/power_supply/sony_controller_battery_*/capacity; do
    if [ -f $f ]; then
        some=1
        echo " $(cat $f)%"
    fi
done

if [ ! $some ]; then
    echo ""
fi
