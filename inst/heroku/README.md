# Deploying to Heroku

## Deploying via a build-pack

Since **dashR** builds upon a [**fiery** web server](https://cran.r-project.org/package=fiery), in order to deploy **dashR** app(s) to Heroku, we can use an approach similar to the one outlined [here](https://www.data-imaginist.com/2017/setting-fire-to-deployment/). If you are brand new to Heroku, I suggest reading that post first then coming back here for a **dashR** example.

There are three critical files required to run any **dashR** app via the [Heroku buildpack for R](https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16): an `Aptfile` for installing system libraries, a `init.R` script for installing R packages, and a `run.R` script for running the **dashR** application. For simple applications, you might not need to modify the `Aptfile`, but if you need R packages that require external system libraries (e.g., **sf**, **leaflet**, **rmarkdown**, etc), you'll need to add suitable libraries to the `Aptfile`. There is a nice collection of system libraries for popular R packages [here](https://github.com/rstudio/shinyapps-package-dependencies/tree/master/packages). 

We suggest that you work from our Heroku app template, which you can summon with the `heroku_app_template()` template function. This copies files to your current working directory, so it's suggested you do this from a new/empty directory.

```r
library(dashR)
heroku_app_template()
```

After you've modified those files to run your **dashR** app, login to Heroku via the command-line tool:

```shell
heroku login
```

If you know your way around git, you can follow these instructions for deploying to Heroku via git, which the `dashR::heroku_app_deploy()` function attempts to automate:

```r
dashR::heroku_app_deploy("my-test-app")
```


## Deploying docker containers

First, make sure to [login with `heroku container:login`, not `heroku login`](https://github.com/fiorix/freegeoip/issues/171#issuecomment-299704440)

```shell
heroku container:login
```

If you haven't already, create a heroku app:

```shell
heroku create
```

<https://devcenter.heroku.com/articles/container-registry-and-runtime>

```shell
cd inst/docker/base
# NOTE: to add --build-args, use --arg, for example
# heroku container:push web --arg GITHUB_PAT='myToken'
heroku container:push web
heroku container:release web
heroku open
```

Note you can also [deploy directly to heroku's registery](https://medium.com/travis-on-docker/how-to-run-dockerized-apps-on-heroku-and-its-pretty-great-76e07e610e22), which makes what's happening a little more straightforward, especially if you'd like you to deploy multiple containers from the same git repo.




