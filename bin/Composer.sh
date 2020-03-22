#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

command -v php >/dev/null 2>&1 || fail "PHP is NOT installed!"

info 'Installing PHP Composer ...'

curl -sS https://getcomposer.org/installer | php

info 'Making Composer system-wide ...'

mv composer.phar /usr/local/bin/composer
