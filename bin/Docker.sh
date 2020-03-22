#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

info 'Removing Docker ...'

apt-get remove -yq docker docker-engine docker.io
snap remove docker

info 'Installing Docker ...'

snap install docker

docker --version
docker pull ubuntu
docker run hello-world
