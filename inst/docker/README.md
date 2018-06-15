# dashR docker images

## Building images

There are currently 3 images: 

* dashr-base: A minimal image for running **dashR** apps
* dashr-plotly: A minimal image for running **plotly** inside **dashR** apps
* dashr-tutorial: An image for running the **dashR** tutorial site

Since **dashR** is still a private repo, you currently need to pass in proper GH creds to build the base image.

```shell
docker build --build-arg GITHUB_PAT='myToken' -f inst/docker/base . -t cpsievert/dashr-base
```

These creds aren't needed for the others:

```shell
docker build -f inst/docker/plotly/Dockerfile . -t cpsievert/dashr-plotly
docker build -f inst/docker/tutorial/Dockerfile . -t cpsievert/dashr-tutorial
```

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

TODO: is it possible to deploy multiple apps (via containers) from the same GH repo?
