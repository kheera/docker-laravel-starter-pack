FROM ubuntu:18.04

MAINTAINER Shane Nelson

# Stops apt-get from asking questions, like what timezone do you live in
ENV DEBIAN_FRONTEND noninteractive

# Docker recommends all apt-get commands occur in one RUN command
# and they should be listed alphabetically so as to prevent installing the same package twice
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    g++ \
    gcc \
    gnupg \
    make \
    libapache2-mod-php \
    vim \
    php \
    php-common \
    php-mbstring \
    php-mysql \
    php-xml \
    php-zip


# Install node
WORKDIR /usr/local/sbin
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash; \
    apt-get install -y nodejs

# Install composer
RUN curl -sL https://raw.githubusercontent.com/composer/getcomposer.org/d3a6ed2ed96ff423fb1991f22e4bcabd3db662f8/web/installer | php -- --quiet
RUN ln -s /usr/local/sbin/composer.phar /usr/local/sbin/composer

WORKDIR /var/www
COPY ./docker/laravel/start.sh /usr/local/sbin/start.sh
