#! /bin/dash

TOGGLE_FILE="/tmp/dnd/dnd_toggle_file"
mkdir -p "/tmp/dnd"

if [ ! -e $TOGGLE_FILE ]; then
	touch $TOGGLE_FILE
	notify-send.py "Entering DnD mode" \
				   "From now on all notifications will be deactivated" \
				   -a "DnD manager" \
				   -i sleep
	notify-send.py a --hint boolean:deadd-notification-center:true \
					 string:type:pausePopups \
					 -a trash_me
else
	rm $TOGGLE_FILE
	notify-send.py a --hint boolean:deadd-notification-center:true \
					 string:type:unpausePopups \
					 -a trash_me
	notify-send.py "Deactivatig DnD mode" \
				   "From now on all notifications will be displayed" \
				   -a "DnD manager" \
				   -i sleep
fi
