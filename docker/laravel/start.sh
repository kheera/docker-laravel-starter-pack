#!/usr/bin/env bash

echo "Starting box customization..."

echo "Running composer update..."
composer update

echo "Running composer install..."
composer install

if [ ! -f /var/www/html/package.json ]; then
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
    composer create-project --prefer-dist laravel/laravel $LARAVEL_INSTALL_WORK_DIR
    mv -vn $LARAVEL_INSTALL_WORK_DIR/* /var/www/html
    mv -vn $LARAVEL_INSTALL_WORK_DIR/.[!.]* /var/www/html
    rm -rf $LARAVEL_INSTALL_WORK_DIR
    echo "Deleted temp laravel install directory $LARAVEL_INSTALL_WORK_DIR"
fi

cd /var/www/html

echo "Starting apache..."
/usr/sbin/apache2ctl -D FOREGROUND


