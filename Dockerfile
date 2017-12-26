FROM composer as composer

COPY ./fs/www/composer.json /www/composer.json

RUN set -x \
    && cd /www \
    && composer update --no-autoloader

FROM alpine:3.6

RUN set -x \
    && apk add --no-cache \
        bash \
        haproxy \
        mariadb \
        mariadb-client \
        memcached \
        nginx \
        nodejs \
        nodejs-npm \
        openssl \
        php7-bz2 \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-json \
        php7-mbstring \
        php7-mysqli \
        php7-opcache \
        php7-openssl \
        php7-session \
        php7-xml \
        php7-zip \
        php7-zlib \
        ruby \
        supervisor \
    && rm -rf \
        /var/lib/mysql \
        /etc/haproxy \
        /etc/nginx \
        /etc/php7/php-fpm.d \
    && mkdir -p \
        /run/mysqld \
        /sessions \
        /var/run/php/ \
    && chown nobody:nobody \
        /sessions \
        /var/run/php/ \
    && chown mysql:mysql /run/mysqld \
    && gem install fakes3 --no-ri --no-rdoc \
    && npm install aws-ses-local -g

COPY ./fs /
COPY --from=composer /www /www

EXPOSE 80 443 3306 8080 8081 8082 11211

VOLUME ["/data"]

ENTRYPOINT ["docker-supervisord-entrypoint"]

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
