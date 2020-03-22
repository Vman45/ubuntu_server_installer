#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Preparing installation ...'

apt-get install -yqq software-properties-common language-pack-en-base
LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
apt-get update -qq
apt-get remove php7* -qq

info 'Installing PHP 7.3 ...'

apt-get install -yqq libapache2-mod-php7.3 openssl \
  php7.3 php7.3-cli php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-mbstring \
  php7.3-mysql php7.3-readline php7.3-pgsql php7.3-sqlite3 php7.3-xml php7.3-zip

info 'Restarting Apache ...'

a2enmod cloudflare expires headers info rewrite ssl status >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1
sudo update-alternatives --set php /usr/bin/php7.3

info "Installation done.\n"

php --version
