#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

command -v nodejs >/dev/null 2>&1 || {
  info "Installing Nodejs ..."
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

command -v yarn >/dev/null 2>&1 || {
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update
  sudo apt-get install yarn
}

info 'Installing Gulp & PWAbuilder ...'

command -v gulp >/dev/null 2>&1 || {
  sudo npm i -g npm
  sudo npm i -g exec
  sudo npm i -g gulp
}

info 'Installing PWAbuilder ...'

command -v gulp >/dev/null 2>&1 || {
  sudo npm i -g pwabuilder
}

info 'Installing Gulp plugins ...'

npm i gulp-autoprefixer
npm i gulp-concat
npm i gulp-cssmin
npm i gulp-jshint
npm i gulp-minify-css
npm i gulp-rename
npm i gulp-replace
npm i gulp-uglify
npm i gulp-util

npm link pwabuilder
npm link gulp
