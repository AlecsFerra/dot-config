#! /bin/sh

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
diskpartuuid=$(cat "$dir/backupdiskpartuuid.txt")

sudo cryptsetup luksOpen "/dev/disk/by-partuuid/$diskpartuuid" BackupDisk
mount /dev/mapper/BackupDisk /media/BackupDisk
