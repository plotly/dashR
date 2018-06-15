# dashR docker containers

The great thing about taking the time and effort to containerize each one of your **dashR** apps is that there are all sorts of awesome services to manage your container(s) to handle scaling and performance. For example, have a look at our [heroku](../heroku) and [on-premise](../on-prem) instructions for deploying containers

## Building images

There are currently 4 images: 

* `dashr-base`: A minimal image for running **dashR** apps
* `dashr-plotly`: A minimal image for running **plotly** inside **dashR** apps
* `dashr-tutorial`: An image for running the **dashR** [tutorial site](https://dashr-tutorial.herokuapp.com/)
* `dashr-forecast`: An image for running an app that leverages the **plotly** and **forecast** packages 
Since **dashR** is still a private repo, you currently need to pass in proper GH creds to build the base image.

```shell
git clone https://github.com/plotly/dashR.git
cd dashR/inst/docker/base
docker build --build-arg GITHUB_PAT='myToken' . -t dashr-base
```

GH creds aren't necessary for the others:

```shell
cd inst/docker/plotly
docker build . -t dashr-plotly
```

Note that the `dashr-tutorial` image must be build from the **dashR** directory

```shell
docker build -f inst/docker/tutorial/Dockerfile . -t dashr-tutorial
```

SIDE NOTE: deploy the tutorial image to heroku via `docker push` [deploying image](https://medium.com/travis-on-docker/how-to-run-dockerized-apps-on-heroku-and-its-pretty-great-76e07e610e22) to heroku!

```shell
# if the app doesn't yet exist...
# heroku create dashr-tutorial
docker build -f inst/docker/tutorial/Dockerfile . -t registry.heroku.com/dashr-tutorial/web
heroku auth:token | docker login --username=_ --password-stdin registry.heroku.com
docker push registry.heroku.com/dashr-tutorial/web
```

Unfortunately, pushing the container does not release it, so we 

```shell
heroku git:remote -a dashr-tutorial
heroku container:push web
```

## Running containers

By default, these images run on root, but you can specify `--user=docker` (recommended) to get a non-root user with the ability to install personal R packages.

```shell
docker run --user=docker -p 8080:8080 dashr-base
```
