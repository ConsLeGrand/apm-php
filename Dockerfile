FROM php:8.1-apache

# Installer SQLite
RUN docker-php-ext-install pdo pdo_sqlite

# Installer Elastic APM PHP Agent
RUN curl -L -o /tmp/apm-agent.tar \
    https://github.com/elastic/apm-agent-php/releases/download/v1.15.1/apm-agent-php-linux-x86-64.tar \
    && mkdir /opt/apm-agent-php \
    && tar -xf /tmp/apm-agent.tar -C /opt/apm-agent-php \
    && rm /tmp/apm-agent.tar

COPY apm-agent-php.ini /usr/local/etc/php/conf.d/
COPY . /var/www/html/

EXPOSE 80
CMD ["apache2-foreground"]
