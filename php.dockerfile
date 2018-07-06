FROM php:7.2-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update \
    && apt-get install unzip \
    && apt-get install -y zlib1g-dev

RUN docker-php-ext-install mysqli \ 
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip

WORKDIR "/var/www/html"