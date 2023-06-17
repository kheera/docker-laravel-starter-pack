FROM ubuntu:22.04

MAINTAINER Shane Nelson

# http://knowledgebasement.com/how-to-run-sites-securely-with-apache-and-php-fpm-on-ubuntu-16-04-lts/
# May have to remove mod_php_apache to get this working
# Set proper owner in:  /etc/php/7.2/fpm/pool.d/www.conf

# Stops apt-get from asking questions, like "what timezone do you live in?"
ARG PROJECT_NAME
ENV DEBIAN_FRONTEND noninteractive
ENV PROJECT_NAME=${PROJECT_NAME}

# Docker recommends all apt-get commands occur in one RUN command so they are in the same image slice
# and they should be listed alphabetically so as to prevent installing the same package twice
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    g++ \
    gcc \
    gnupg \
    libapache2-mod-php8.1 \
    php8.1 \
    php8.1-common \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-fpm \
    php8.1-curl \
    php8.1-xml \
    php8.1-zip \
    rsync \
    unzip \
    vim

RUN a2enmod rewrite
RUN a2enmod proxy_fcgi setenvif
RUN a2enconf php8.1-fpm
RUN a2enmod ssl

RUN mkdir /etc/self-signed/
RUN printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth" > /etc/self-signed/openssl.conf
RUN openssl req -x509 -out /etc/self-signed/localhost.crt -keyout /etc/self-signed/localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT \
  -config /etc/self-signed/openssl.conf

# Install node (so we can use npm)
WORKDIR /usr/local/sbin
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash; \
    apt-get install -y nodejs

# Install composer (used to install Laravel)
RUN curl -sL https://raw.githubusercontent.com/composer/getcomposer.org/d3a6ed2ed96ff423fb1991f22e4bcabd3db662f8/web/installer | php -- --quiet
RUN ln -s /usr/local/sbin/composer.phar /usr/local/sbin/composer

# Modify apache config for Laravel
COPY ./docker/laravel/apache/000-default.conf /etc/apache2/sites-available/

# Redirects log files to docker console
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

WORKDIR /var/www
COPY ./docker/laravel/start.sh /usr/local/sbin/start.sh
RUN chmod +x /usr/local/sbin/start.sh

WORKDIR /var/www/html
