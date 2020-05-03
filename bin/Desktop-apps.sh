#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v snap >/dev/null 2>&1 || fail "Snap is NOT installed!"

info 'Installing SnapCraft apps ...\n'
sleep 2

info "Android Studio"
snap install android-studio --classic

info "Visual Studio Code"
snap install code --classic

info "doctl"
snap install doctl

info "ffmpeg"
snap install ffmpeg

info "jq"
snap install jq

info "ruby"
snap install ruby --classic

info "SyncThing"
snap install syncthing
