#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v snap >/dev/null 2>&1 || fail "Snap is NOT installed!"

snap install android-studio --classic
snap install code --classic
snap install doctl
snap install ffmpeg
snap install jq
snap install ruby --classic
snap install syncthing
