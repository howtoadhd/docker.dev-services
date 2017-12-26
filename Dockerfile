FROM alpine:3.6

RUN set -x \
    && apk add --no-cache \
        bash \
        mariadb \
        mariadb-client \
        memcached \
        openssl \
        ruby \
        supervisor \
    && rm -rf \
        /var/lib/mysql \
    && mkdir -p /run/mysqld \
    && chown mysql:mysql /run/mysqld \
    && gem install fakes3 --no-ri --no-rdoc

COPY ./fs /

EXPOSE 3306 8081 11211

VOLUME ["/data"]

ENTRYPOINT ["docker-supervisord-entrypoint"]

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
