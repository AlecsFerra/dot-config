#! /bin/dash

brightness_file="/sys/class/backlight/intel_backlight/brightness"
max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness"

max_brightness=$(cat $max_brightness_file)

while inotifywait -qq -e modify $brightness_file; do
  current_brightness=$(cat $brightness_file)
  ratio=$(echo "scale=4; $current_brightness / $max_brightness * 100" \
          | bc \
          | sed "s/\.0*//")
  echo $ratio
done
