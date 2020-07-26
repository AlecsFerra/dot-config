#/bin/sh

. "${HOME}/.cache/wal/colors.sh"

 reload_dunst() {
    pkill dunst
    dunst \
	-frame_width 0 \
        -lb "${color0}" \
        -nb "${color0}" \
        -cb "${color0}" \
        -lf "${color7}" \
        -bf "${color7}" \
        -cf "${color7}" \
        -nf "${color7}" &
}

reload_dunst

