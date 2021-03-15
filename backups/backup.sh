#! /bin/sh
 rsync -avzp --exclude-from='exclude.txt' \
   /home/alecs alecs@trash-pc:/home/alecs/backup-home 
