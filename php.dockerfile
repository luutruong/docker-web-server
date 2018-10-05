FROM php:7.2-fpm

ARG PHP_GD=false

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update \
    && apt-get install unzip \
    && apt-get install -y zlib1g-dev

RUN docker-php-ext-install mysqli \ 
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip

RUN if [ ${PHP_GD} = true ]; then \

apt-get install -y \ 
    libfreetype6-dev \ 
    libjpeg62-turbo-dev \
    zlib1g-dev \ 
    libpng-dev \
    libjpeg-dev \
	&& docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install gd \
;fi

WORKDIR "/var/www/html"