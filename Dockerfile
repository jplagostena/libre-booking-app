FROM php:8.2-apache-bullseye

ARG DB_HOST=mysql
ARG DB_USER=librebooking
ARG DB_PASSWORD
ARG DB_DATABASE=librebooking
ARG LB_ENV=production
ARG EMBED_MYSQL=true
ARG INSTALL_PASSWORD=install
ARG SCRIPT_URL=http://localhost:8080/
ARG ADMIN_EMAIL=admin@example.com

ENV DB_HOST=$DB_HOST
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_DATABASE=$DB_DATABASE
ENV LB_ENV=$LB_ENV
ENV EMBED_MYSQL=$EMBED_MYSQL
ENV INSTALL_PASSWORD=$INSTALL_PASSWORD
ENV SCRIPT_URL=$SCRIPT_URL
ENV ADMIN_EMAIL=$ADMIN_EMAIL

RUN mkdir /var/www/librebooking/
COPY . /var/www/librebooking/
COPY entrypoint.sh /
RUN sed -i "s#DocumentRoot /var/www/html#DocumentRoot /var/www/librebooking#" /etc/apache2/sites-enabled/000-default.conf
RUN a2enmod rewrite

WORKDIR /var/www/librebooking/
RUN mkdir -p tpl_c tpl uploads
RUN chown -R www-data:www-data tpl_c tpl uploads

RUN apt-get -y update && apt-get install -y libzip-dev zip libpng-dev wget gnupg
RUN docker-php-ext-install mysqli gd

COPY --from=composer/composer /usr/bin/composer /usr/bin/composer

RUN composer --no-interaction install

CMD /entrypoint.sh
