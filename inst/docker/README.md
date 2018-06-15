# dashR docker images

## Building images

Since **dashR** is still a private repo, you currently need to pass in proper GH creds to build images. Currently we support two images: base and tutorial. The base image is meant to be a minimal image for running dashR whereas the tutorial image is specifically for running the dashR tutorial site. Here's how to build the base image:

```shell
docker build --build-arg GITHUB_PAT='myToken' inst/docker/base . -t cpsievert/dashr-base
```

And the tutorial:

```shell
docker build -f inst/docker/tutorial/Dockerfile . -t cpsievert/dashr-tutorial
```

TODO: we should do something similar for plotly/dashRauth, but perhaps those Dockerfiles should live in that repo?

## Running containers

By default, these images run on root, but you can specify `--user=docker` (recommended) to get a non-root user with the ability to install personal R packages.

```shell
docker run --user=docker -p 8080:8080 cpsievert/dashr-base
```

## Deploying to heroku

First, [login with `heroku container:login`, not `heroku login`](https://github.com/fiorix/freegeoip/issues/171#issuecomment-299704440) 🙄 

```shell
heroku container:login
```

<https://devcenter.heroku.com/articles/container-registry-and-runtime>

```shell
cd inst/docker/base
heroku container:push web --arg GITHUB_PAT='myToken'
heroku container:release web
heroku open
```
