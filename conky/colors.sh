#!/bin/bash

source ~/.cache/wal/colors.sh

echo "\${color $(eval echo \$$1)}"
