#!/bin/bash

ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME"/.config

ln -s "$ABSOLUTE_PATH"/alacritty $TARGET
ln -s "$ABSOLUTE_PATH"/xmonad/   $HOME/.xmonad
# Dunst removed to use linux notification centre
# ln -s "$ABSOLUTE_PATH"/dunst     $TARGET
ln -s "$ABSOLUTE_PATH"/deadd     $TARGET
ln -s "$ABSOLUTE_PATH"/picom     $TARGET
ln -s "$ABSOLUTE_PATH"/polybar   $TARGET
ln -s "$ABSOLUTE_PATH"/scripts   $TARGET
ln -s "$ABSOLUTE_PATH"/sxhkd     $TARGET
ln -s "$ABSOLUTE_PATH"/xob       $TARGET
ln -s "$ABSOLUTE_PATH"/rofi      $TARGET
ln -s "$ABSOLUTE_PATH"/nvim      $TARGET
ln -s "$ABSOLUTE_PATH"/newsboat  $TARGET
ln -s "$ABSOLUTE_PATH"/secrets   $TARGET
ln -s "$ABSOLUTE_PATH"/conky     $TARGET
ln -s "$ABSOLUTE_PATH"/wal       $TARGET
ln -s "$ABSOLUTE_PATH"/zathura   $TARGET
ln -s "$ABSOLUTE_PATH"/chrome    $HOME/.mozilla/firefox/*.default-release
