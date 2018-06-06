FROM php:7-alpine

MAINTAINER Yuri Soffner <ysoffner@gmail.com>

ENV PHPCS_VERSION=3.2.3

RUN apk update && apk upgrade && apk add bash

RUN curl -L https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.2.3/phpcs.phar > /usr/local/bin/phpcs \
    && chmod +x /usr/local/bin/phpcs \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

#VOLUME ["/project"]
WORKDIR /project

ENTRYPOINT ["phpcs"]
CMD ["--version"]
