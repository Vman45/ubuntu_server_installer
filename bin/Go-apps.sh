#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi
command -v /usr/local/go/bin/go >/dev/null 2>&1 || fail "Go is NOT installed!"

info 'Installing Go apps ...\n'
sleep 2

info "lazydocker"
/usr/local/go/bin/go get github.com/jesseduffield/lazydocker

info "lazygit"
/usr/local/go/bin/go get github.com/jesseduffield/lazygit

info "rclone"
/usr/local/go/bin/go get github.com/rclone/rclone
