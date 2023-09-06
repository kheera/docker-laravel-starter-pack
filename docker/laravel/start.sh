#!/usr/bin/env bash

echo "Starting box customization..."

if [ ! -f /var/www/package.json ]; then
    START_NEW_LARAVEL_INSTALL=true
fi

if [ $START_NEW_LARAVEL_INSTALL ]; then
    echo "This looks like a new project."
    echo "Installing laravel..."
    LARAVEL_MKTEMP_TEMPLATE=/var/www/laravel_install_XXXXX
    LARAVEL_INSTALL_WORK_DIR=`mktemp -d $LARAVEL_MKTEMP_TEMPLATE`
    # check if install dir was created
    if [[ ! $LARAVEL_INSTALL_WORK_DIR || ! -d $LARAVEL_INSTALL_WORK_DIR ]]; then
      echo "Could not create laravel temp install dir"
      exit 1
    fi
    composer create-project laravel/laravel $LARAVEL_INSTALL_WORK_DIR
    mv -vn $LARAVEL_INSTALL_WORK_DIR/* /var/www
    mv -vn $LARAVEL_INSTALL_WORK_DIR/.[!.]* /var/www
    rm -rf $LARAVEL_INSTALL_WORK_DIR
    echo "Deleted temp laravel install directory $LARAVEL_INSTALL_WORK_DIR"
fi

echo "Running composer install and update..."
composer update; composer install

cd /var/www

echo "Starting apache..."
service php8.1-fpm restart
/usr/sbin/apache2ctl -D FOREGROUND


