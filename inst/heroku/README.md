# Deploying to Heroku

There are at least two ways to deploy a **dashR** app to [Heroku](https://www.heroku.com/): via a build-pack or a [docker](https://www.docker.com/) container. The docker approach is more flexible in that you can completely control the computing environment of your app, but as a result it's a bit more cumbersome. If you have interest in using docker, you may want to build off our minimal [base images](../docker).

## Deploying via a build-pack

Since **dashR** builds upon a [**fiery** web server](https://cran.r-project.org/package=fiery), in order to deploy **dashR** app(s) to Heroku, we can use an approach similar to the one outlined [here](https://www.data-imaginist.com/2017/setting-fire-to-deployment/). If you are brand new to Heroku, I suggest reading that post first then coming back here for a **dashR** example.

There are three critical files required to run any **dashR** app via the [Heroku buildpack for R](https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16): an `Aptfile` for installing system libraries, a `init.R` script for installing R packages, and a `run.R` script for running the **dashR** application. For simple applications, you probably won't have to modify the `Aptfile`, but if you need R packages that require external system libraries (e.g., **sf**, **leaflet**, **rmarkdown**, etc), you have to add relevant apt packages to this file. There is a nice collection of apt requirements for popular R packages [here](https://github.com/rstudio/shinyapps-package-dependencies/tree/master/packages). 

We suggest that you start from our Heroku app template, which you can summon via the `heroku_app_template()` function. This copies the template to your current working directory:

```r
library(dashR)
heroku_app_template()
```

After you've modified those files to run your own **dashR** app, login to Heroku via the command-line tool:

```shell
heroku login
```

If you know your way around git, you can follow these instructions for [deploying to Heroku via git](https://devcenter.heroku.com/articles/git), which the `dashR::heroku_app_deploy()` function attempts to automate for you:

```r
dashR::heroku_app_deploy("my-test-app")
```


## Deploying docker containers

First, make sure to [login with `heroku container:login`, not `heroku login`](https://github.com/fiorix/freegeoip/issues/171#issuecomment-299704440)

```shell
heroku container:login
```

Say you already have a docker image named `dashr-app` and you'd like to deploy that image to a Heroku app named `dashr-app`. First, if it doesn't already exist, create the heroku app:

```shell
heroku create dashr-app
```

Now, in order to have proper permissions to `docker push` the image to Heroku's registry, login to docker via Heroku.

```shell
heroku auth:token | docker login --username=_ --password-stdin registry.heroku.com
```

Before pushing, make sure the docker image (e.g., `dashr-app`) has a tag that is prefixed with `registry.heroku.com/` and suffixed with `/web` to ensure Heroku's docker registry knows about the image:

```shell
docker build . -t registry.heroku.com/dashr-app/web
docker push registry.heroku.com/dashr-app/web
```

Note that *pushing* the image to the registry does not actually *release* it, but we can tell Heroku to release like so:

```shell
heroku git:remote -a dashr-app
heroku container:release web
```

Now, if your app was named `dashr-app`, it should be available at <https://dashr-app.herokuapp.com>.
