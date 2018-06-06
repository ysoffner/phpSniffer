FROM php:7-alpine

MAINTAINER Yuri Soffner <ysoffner@gmail.com>

RUN apk update && apk upgrade && apk add --no-cache bash git openssh bash
RUN mkdir /phptools/ && cd /phptools/ &&  \
git clone https://github.com/squizlabs/PHP_CodeSniffer.git phpcs && \
git clone https://github.com/wimg/PHPCompatibility.git phpcomp && \
cd phpcs && \
chmod +x /phptools/phpcs/bin/phpcs && \
./bin/phpcs --config-set installed_paths ../phpcomp && \
ln -s /phptools/phpcs/bin/phpcs /usr/local/bin/phpcs && \
rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

#VOLUME ["/project"]
WORKDIR /project

ENTRYPOINT ["phpcs"]
CMD ["--version"]
