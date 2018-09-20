FROM debian:jessie
MAINTAINER e.marchenkov@richbrains.net

USER root
RUN apt-get --yes --force-yes update \
    && apt-get install --yes --force-yes wget curl apt-transport-https lsb-release ca-certificates \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
    && apt-get update -qq -y \
    && apt-get --yes --force-yes install php7.1-cli php7.1-fpm php7.1-apcu php7.1-apcu-bc php7.1-curl php7.1-json php7.1-intl php7.1-opcache php7.1-readline php7.1-mysql php7.1-xml php7.1-zip \
    && apt-get --yes --force-yes install git nodejs npm \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs git &&\
  npm install -g bower &&\
  npm install -g grunt
