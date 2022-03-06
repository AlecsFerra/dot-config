#! /bin/bash

TRAYTMP="/tmp/trayer"

if [ ! -e $TRAYTMP ]; then
	touch $TRAYTMP
  trayer \
      --edge left \
      --distancefrom left   --distance 6 \
      --align center \
      --expand false \
      --heighttype pixel --height 45 \
      --widthtype  pixel --width  100 \
      --tint "0x282c34" &
else
	rm $TRAYTMP
  killall trayer
fi
