[![License](https://img.shields.io/github/license/ysoffner/phpsniffer.svg)]()
[![Build Status](https://travis-ci.org/ysoffner/phpSniffer.svg?branch=master)](https://travis-ci.org/ysoffner/phpSniffer)
[![Version](https://images.microbadger.com/badges/version/ysoffner/phpsniffer.svg)](https://microbadger.com/images/ysoffner/phpsniffer)
[![Layers](https://images.microbadger.com/badges/image/ysoffner/phpsniffer.svg)](https://microbadger.com/images/ysoffner/phpsniffer)
[![Coverity](https://scan.coverity.com/projects/16037/badge.svg)](https://scan.coverity.com/projects/16037/badge.svg)

## `Docker hub` links
https://hub.docker.com/r/ysoffner/phpsniffer/

## What is PHP_CodeSniffer and phpcs?

PHP_CodeSniffer's `phpcs` is a script that tokenizes PHP, JavaScript and CSS files to detect violations of a defined coding standard.

> https://github.com/squizlabs/PHP_CodeSniffer

## PHP Compatibility Coding Standard for PHP CodeSniffer

This is a set of sniffs for PHP CodeSniffer that checks for PHP version compatibility. It will allow you to analyse your code for compatibility with higher and lower versions of PHP.

> https://github.com/wimg/PHPCompatibility


## How to use this image

Basic usage.

```sh
docker run --rm \
    --volume /local/path:/project \
    ysoffner/phpsniffer[:tag] [<options>]
```

For example, to check `src` directory against the PSR1 and PSR2 coding standard.

```sh
docker run --rm \
    --volume /local/path:/project \
    ysoffner/phpsniffer \
    --standard=PSR1,PSR2 \
    file/path
```


Example, to use `phpCompatibility`.

```sh
docker run --rm \
    --volume /local/path:/project \
    ysoffner/phpsniffer \
    --standard=PHPCompatibility --extensions=php --runtime-set testVersion 7.1 \
    file/path
```
## Volumes

* `/project`: Is your Workdir and PHP project directory.
 
 based from [`herloct`](https://github.com/herloct)
