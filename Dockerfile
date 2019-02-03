FROM php:7.3-fpm-stretch

RUN apt update
RUN apt -y install libpng-dev libzip-dev git
RUN docker-php-ext-install gd && docker-php-ext-install zip
RUN apt remove -y libpng-dev libzip-dev

RUN php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php --install-dir=/usr/bin --filename=composer \
  && php -r "unlink('composer-setup.php');"

RUN composer global require "laravel/installer"

WORKDIR /var/www/html/project