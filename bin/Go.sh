#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Removing old Go ...'

rm -rf /usr/local/go

info 'Installing new Go ...'

T="/tmp/go1.14.tar.gz"
if [ ! -f "$T" ]; then
  sleep 2
  wget -O $T https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
fi

tar -C /usr/local -xzf $T
/usr/local/go/bin/go version
yes_or_no "Remove temporary file?" && rm -f $T