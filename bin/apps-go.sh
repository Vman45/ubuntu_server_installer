#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v /usr/local/go/bin/go >/dev/null 2>&1 || fail "Go is NOT installed!"

info 'Installing Go apps ...\n'
sleep 2

export GO111MODULE=on

info "lazydocker"
/usr/local/go/bin/go get github.com/jesseduffield/lazydocker
lazydocker --version

info "lazygit"
/usr/local/go/bin/go get github.com/jesseduffield/lazygit
lazygit --version

info "rclone"
/usr/local/go/bin/go get github.com/rclone/rclone
rclone --version
