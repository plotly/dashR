# Deploying to heroku

## Deploying via a build-pack

<https://github.com/plotly/dashR-on-premise-sample-app>

## Deploying docker containers

First, make sure to [login with `heroku container:login`, not `heroku login`](https://github.com/fiorix/freegeoip/issues/171#issuecomment-299704440)

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


