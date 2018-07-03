FROM php:7.2-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR "/var/www/html"