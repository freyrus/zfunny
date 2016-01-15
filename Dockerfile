FROM freyrus/base-php7.0

MAINTAINER gialac <gialacmail@gmail.com>

# Clean up APT when done.
USER root

# install mongodb driver for php
RUN pecl install mongodb
RUN echo "extension=mongodb.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`

# clear all cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD .               /var/www
WORKDIR             /var/www
USER www-data
EXPOSE 80