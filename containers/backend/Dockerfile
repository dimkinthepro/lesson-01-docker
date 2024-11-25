FROM debian:12

RUN apt update \
    && apt full-upgrade

RUN apt install -y \
    wget \
    git

RUN apt install -y \
    php-pear \
    php8.2 \
    php8.2-dev \
    php8.2-fpm \
    php8.2-opcache \
    php8.2-cli \
    php8.2-mysql \
    php8.2-zip \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-curl \
    php8.2-bcmath \
    php8.2-common \
    php8.2-xml \
    php8.2-intl

ENTRYPOINT ["/bin/bash", "/files/entrypoint.sh"]
