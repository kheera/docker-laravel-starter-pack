FROM ubuntu:18.04

MAINTAINER Shane Nelson

# Stops apt-get from asking questions, like "what timezone do you live in?"
ARG PROJECT_NAME
ENV DEBIAN_FRONTEND noninteractive
ENV PROJECT_NAME=${PROJECT_NAME}

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
    php-curl \
    php-mbstring \
    php-mysql \
    php-xml \
    php-zip \
    rsync \
    unzip


# Install node (so we can use npm)
WORKDIR /usr/local/sbin
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash; \
    apt-get install -y nodejs

RUN curl -sS https://getcomposer.org/installer \
    | php && mv composer.phar /usr/local/bin/composer \
    && composer global require hirak/prestissimo --no-plugins --no-scripts

# Modify apache config for Laravel
COPY ./docker/laravel/apache/000-default.conf /etc/apache2/sites-enabled/

# Redirects log files to docker console
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

WORKDIR /var/www
COPY ./docker/laravel/start.sh /usr/local/sbin/start.sh

WORKDIR /var/www/html
