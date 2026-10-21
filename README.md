# docker-nginx-php

![Build Status](https://img.shields.io/github/actions/workflow/status/robin-moser/docker-nginx-php/docker-release.yml?logo=github&logoColor=white)
[![Docker Pulls](https://img.shields.io/docker/pulls/robinmoser/nginx-php?logo=docker&logoColor=white&color=blue)](https://hub.docker.com/r/robinmoser/nginx-php)

A simple Docker container which contains the nginx webserver and a php-fpm 8 installation on top of alpine:edge. It uses [S6-overlay](https://github.com/just-containers/s6-overlay) as an init system to start additional services.

## Environment Variables

| Variable       | Default         |
| -------------- | --------------- |
| TZ             | `Europe/Berlin` |
| NGINX_WEB_ROOT | `/app/src`      |
| NGINX_DOMAIN   |                 |
| NGINX_INDEX    | `index.php`     |

If the variable `NGINX_DOMAIN` is set, every request that comes from a different domain will be redirected to the `NGINX_DOMAIN` while keeping its path and parameters.
