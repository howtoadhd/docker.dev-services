FROM alpine:3.6

RUN set -x \
    && apk add --no-cache \
        bash \
        haproxy \
        mariadb \
        mariadb-client \
        memcached \
        nodejs \
        nodejs-npm \
        openssl \
        ruby \
        supervisor \
    && rm -rf \
        /var/lib/mysql \
        /etc/haproxy \
    && mkdir -p /run/mysqld \
    && chown mysql:mysql /run/mysqld \
    && gem install fakes3 --no-ri --no-rdoc \
    && npm install aws-ses-local -g

COPY ./fs /

EXPOSE 80 443 3306 8081 8082 11211

VOLUME ["/data"]

ENTRYPOINT ["docker-supervisord-entrypoint"]

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
