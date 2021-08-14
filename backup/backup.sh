#! /bin/sh

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

home="/home/alecs/"
ackuplocation="/media/BackupDisk/backupArch"

rsync -arvzp \
  --progress \
  --exclude-from="$dir/exclude.txt" \
  --files-from="$dir/include.txt" \
  "$home" \
  "$backuplocation"
