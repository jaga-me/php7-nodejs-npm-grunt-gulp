FROM debian:jessie
MAINTAINER developer@jaga-me.com

USER root
RUN apt-get --yes --force-yes update \
    && apt-get install --yes --force-yes wget curl apt-transport-https lsb-release ca-certificates \
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
    && apt-get update -qq -y \
    && apt-get --yes --force-yes install php7.2-cli php7.2-fpm php7.2-apcu php7.2-apcu-bc php7.2-mbstring php7.2-curl php7.2-json php7.2-intl php7.2-opcache php7.2-readline php7.2-mysql php7.2-xml php7.2-zip \
    && apt-get --yes --force-yes install git nodejs npm \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs git &&\
  npm install -g bower &&\
  npm install -g grunt &&\
  npm install -g gulp
