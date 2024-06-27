FROM php:8.2-fpm

USER root

# Install the necessary packages
RUN apt-get update && apt-get upgrade -y \
 && apt-get install apt-utils -y \
 && apt-get install git zip vim mc libzip-dev libgmp-dev libffi-dev libssl-dev exim4 nodejs npm -y

RUN apt-get install -y\
 build-essential\
 libpng-dev\
 libjpeg62-turbo-dev\
 libfreetype6-dev\
 locales\
 jpegoptim optipng pngquant gifsicle \
 unzip\
 curl

RUN sed -i 's@local@internet@' /etc/exim4/update-exim4.conf.conf \
 && update-exim4.conf

RUN apt-get install -y libpq-dev\
 && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
 && docker-php-ext-install pdo pdo_pgsql pgsql opcache \
 && docker-php-ext-configure gd --with-freetype --with-jpeg

RUN apt install libicu-dev -y \
 && docker-php-ext-install intl \
 && docker-php-ext-enable intl

RUN apt-get install -y ssmtp && \
 apt-get clean && \
 echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf && \
 echo 'sendmail_path = "/usr/sbin/ssmtp -t"' > /usr/local/etc/php/conf.d/mail.ini

# Clean temporary files
RUN docker-php-source delete\
 && apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add a user for the Laravel application
RUN groupadd -g 1000 www || true && echo "The WWW group already exists"
RUN useradd -u 1000 -ms /bin/bash -g www www || true && echo "User has already been added"

# Copy the contents of the existing application directory
COPY. /var/www

# Copy existing application directory permissions
COPY --chown=www:www . /var/www

# Change the user to www
USER www

# Set port to 9000 and run FPM
EXPOSE 9000
CMD ["php-fpm"]
