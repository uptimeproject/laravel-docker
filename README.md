<a href="https://uptimeproject.io" target="_blank"><img src="https://uptimeproject.io/img/logo.png" height="50px" /></a>

![GitHub Workflow Status](https://github.com/uptimeproject/laravel-docker/actions/workflows/deploy-build.yml/badge.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/uptimeproject/php-laravel)


This repo contains images used to run Laravel on Docker. We use this at UptimeProject.io and decided to OpenSource it
in case anyone wants to use it in their own projects. 😁 

## Images

| Image                       | Tags                                 | Registry | 
|:----------------------------|:-------------------------------------|:---------|
| `uptimeproject/php-laravel` | `7.4-fpm` `7.4-fpm-xdebug` `8.0-fpm` | [hub.docker.com](https://hub.docker.com/repository/docker/uptimeproject/php-laravel) |

## How to contribute

Feel free to create a PR if you have any ideas for improvements. Or create an issue.

### Directory structure

The directories in the root of the project represent the containers.
The dockerfiles inside represent variants and will become docker tags. 

### ./build-and-release.sh

This script automatically walks through the directory structure and then builds and pushes the images.

By default it only builds the containers:
```bash
./build-and-release.sh
```

If you want to also release you have to explicitly pass `--release`:
```bash
./build-and-release.sh --release
```
