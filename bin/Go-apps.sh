#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v go >/dev/null 2>&1 || fail "Go is NOT installed!"

go get github.com/jesseduffield/lazydocker
go get github.com/jesseduffield/lazygit
go get github.com/rclone/rclone
