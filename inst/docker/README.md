# dashR docker containers

The great thing about taking the time and effort to containerize each one of your **dashR** apps is that there are all sorts of awesome services to manage your container(s) to handle scaling and performance. For example, have a look at our [heroku](../heroku) and [on-premise](../on-prem) instructions for deploying containers

## Building images

There are currently 2 images: 

* `dashr-base`: A minimal image for running **dashR** apps
* `dashr-tutorial`: An image for running the **dashR** [tutorial site](https://dashr-tutorial.herokuapp.com/)

```shell
git clone https://github.com/plotly/dashR.git
cd dashR/inst/docker/dashr-base
docker build --build-arg GITHUB_PAT='myToken' . -t dashr-base
```

Note that the `dashr-tutorial` image must be build from the **dashR** directory

```shell
docker build -f inst/docker/tutorial/Dockerfile . -t dashr-tutorial
```

## Running containers

By default, these images run on root, but you can specify `--user=docker` (recommended) to get a non-root user with the ability to install personal R packages.

```shell
docker run --user=docker -p 8080:8080 dashr-base
```
