#! /bin/bash

TRAYTMP="/tmp/trayer"

if [ ! -e $TRAYTMP ]; then
	touch $TRAYTMP
  trayer \
      --tint 0xff8800 --alpha 255 \
      --edge left \
      --distancefrom left   --distance 6 \
      --align center \
      --expand false \
      --heighttype pixel --height 45 \
      --widthtype  pixel --width  100 &
else
	rm $TRAYTMP
  killall trayer
fi
