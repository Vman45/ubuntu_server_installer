#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir"/_includes.sh"

if [ "$(id -u)" != "0" ]; then fail "This script must be run as root!"; fi

PASSWORD=`generate_password`
MYSQL_FILE="${HOME}/MYSQL_ROOT_PASSWORD"

R=1
if [ -s "${MYSQL_FILE}" ]; then yes_or_no "Reinstall MySQL?" || R=0; fi
if [ $R -gt 0 ]; then
  info "Installing / Updating MySQL server ..."
  apt-get install mysql-server-5.7 mysql-utilities -qq
  echo ${PASSWORD} > ${MYSQL_FILE}
  chmod 0600 ${MYSQL_FILE}
  service mysql stop
  mkdir -p /var/run/mysqld
  chown mysql:mysql /var/run/mysqld
  mysqld_safe --skip-grant-tables --skip-networking &
  sleep 2
  QUERY="flush privileges;"
  QUERY="${QUERY} update mysql.user set authentication_string=PASSWORD('${PASSWORD}'), plugin='mysql_native_password' where User='root' and Host='localhost';"
  QUERY="${QUERY} flush privileges;"
  mysql -u root -e "$QUERY"
  mysqladmin -S /var/run/mysqld/mysqld.sock shutdown
  killall mysql >/dev/null 2>&1
  killall mysqld >/dev/null 2>&1
  service mysql start
  sleep 1
  info "\n\nNew password is set to: ${MYSQL_ROOT_PASSWORD}"
fi
