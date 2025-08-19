FROM php:8.1-apache

ENV ELASTIC_APM_SERVICE_NAME=omni356 \
    ELASTIC_APM_SERVER_URL=http://fleet01.heritage.africa:8200 \
    ELASTIC_APM_ENVIRONMENT=production \
    ELASTIC_APM_LOG_LEVEL=INFO
    
# Installer dépendances nécessaires pour PDO_SQLite
RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    && docker-php-ext-install pdo pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*

# Installer Elastic APM PHP Agent
RUN curl -L -o /tmp/apm-agent.tar \
    https://github.com/elastic/apm-agent-php/releases/download/v1.15.1/apm-agent-php-linux-x86-64.tar \
    && mkdir /opt/apm-agent-php \
    && tar -xf /tmp/apm-agent.tar -C /opt/apm-agent-php \
    && rm /tmp/apm-agent.tar

# Copier la conf APM et l'application
COPY apm-agent-php.ini /usr/local/etc/php/conf.d/
COPY . /var/www/html/

EXPOSE 80
CMD ["apache2-foreground"]
