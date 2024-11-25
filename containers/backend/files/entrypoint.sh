#!/bin/bash -e

if [ ! -f /files/var/supervisord ]; then
  echo 'Downloading supervisord'
  wget -q -O /files/var/supervisord https://github.com/ochinchina/supervisord/releases/download/v0.6.3/supervisord_0.6.3_linux_amd64
  chmod 755 /files/var/supervisord
fi
cp /files/var/supervisord /usr/sbin/supervisord

if [ ! -f /files/var/composer ]; then
  echo 'Downloading composer'
  wget -q -O /files/var/composer https://getcomposer.org/download/latest-stable/composer.phar
  chmod 755 /files/var/composer
fi
cp /files/var/composer /usr/local/bin/composer

if [ ! -f /files/var/symfony ]; then
  echo 'Installing symfony'
  wget -q -O /files/var/symfony https://get.symfony.com/cli/installer
  chmod 755 /files/var/symfony
  /files/var/symfony
  /root/.symfony5/bin/symfony new --dir=/var/www --webapp
fi
cp /files/php/www.conf /etc/php/8.2/fpm/pool.d/
chown www-data:www-data -R /var/www/*

echo 'Starting supervisor'
supervisord -c /files/supervisor/supervisor.conf
