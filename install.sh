#!/bin/bash

ABSOLUTE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME"/.config

ln -s "$ABSOLUTE_PATH"/alacritty          $TARGET
ln -s "$ABSOLUTE_PATH"/xmonad/            $HOME/.xmonad
ln -s "$ABSOLUTE_PATH"/deadd              $TARGET
ln -s "$ABSOLUTE_PATH"/picom              $TARGET
ln -s "$ABSOLUTE_PATH"/eww                $TARGET
ln -s "$ABSOLUTE_PATH"/scripts            $TARGET
ln -s "$ABSOLUTE_PATH"/sxhkd              $TARGET
ln -s "$ABSOLUTE_PATH"/xob                $TARGET
ln -s "$ABSOLUTE_PATH"/rofi               $TARGET
ln -s "$ABSOLUTE_PATH"/nvim               $TARGET
ln -s "$ABSOLUTE_PATH"/newsboat           $TARGET
ln -s "$ABSOLUTE_PATH"/secrets            $TARGET
ln -s "$ABSOLUTE_PATH"/conky              $TARGET
ln -s "$ABSOLUTE_PATH"/wal                $TARGET
ln -s "$ABSOLUTE_PATH"/zathura            $TARGET
ln -s "$ABSOLUTE_PATH"/octave             $TARGET
ln -s "$ABSOLUTE_PATH"/python/pythonrc.py $TARGET
ln -s "$ABSOLUTE_PATH"/zsh                $TARGET
ln -s "$ABSOLUTE_PATH"/aspell             $TARGET
ln -s "$ABSOLUTE_PATH"/espanso            $TARGET
ln -s "$ABSOLUTE_PATH"/zsh/.zshenv        $HOME
ln -s "$ABSOLUTE_PATH"/chrome             $HOME/.librewolf/*.default-release

# Cleanup xmonad
rm -rf ~/.xmonad/xmonad

echo -n "Install root components (Y/N)? "
read -r root_comp </dev/tty
if [ "$root_comp" = "Y" ]; then
  echo "Installing root components!"

  # Monitor rule
  sudo cp "$ABSOLUTE_PATH/hooks/95-monitor-hotplug.rules" /etc/udev/rules.d/
  sudo chmod 644 "/etc/udev/rules.d/95-monitor-hotplug.rules"

else
  echo "Ok, exiting!"
fi
