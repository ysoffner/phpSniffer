FROM php:7-alpine

MAINTAINER Yuri Soffner <ysoffner@gmail.com>
ENV Version_CodeSniffer 3.3.0
ENV Version_Compatibility 8.1.0

RUN apk add --no-cache unzip \
&& mkdir /phptools/ && cd /phptools/ \
&& curl -LJOs https://github.com/wimg/PHPCompatibility/archive/$Version_Compatibility.zip > /dev/null\
&& curl -LJOs https://github.com/squizlabs/PHP_CodeSniffer/archive/$Version_CodeSniffer.zip> /dev/null \
&& unzip -qq PHPCompatibility-$Version_Compatibility.zip && mv PHPCompatibility-$Version_Compatibility phpcomp \
&& unzip -qq PHP_CodeSniffer-$Version_CodeSniffer.zip && mv PHP_CodeSniffer-$Version_CodeSniffer phpcs \
&& chmod +x /phptools/phpcs/bin/phpcs \
&& /phptools/phpcs/bin/phpcs --config-set installed_paths /phptools/phpcomp \
&& ln -s /phptools/phpcs/bin/phpcs /usr/local/bin/phpcs \
&& rm -rf /var/cache/apk/* /var/tmp/* /tmp/* /phptools/*.zip

COPY php.ini /usr/local/etc/php/php.ini

#VOLUME ["/project"]
WORKDIR /project

ENTRYPOINT ["phpcs"]
CMD ["--version"]
