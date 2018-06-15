# dashR docker images

## Building images

There are currently 3 images: 

* `dashr-base`: A minimal image for running **dashR** apps
* `dashr-plotly`: A minimal image for running **plotly** inside **dashR** apps
* `dashr-tutorial`: An image for running the **dashR** tutorial site

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

## Running containers

By default, these images run on root, but you can specify `--user=docker` (recommended) to get a non-root user with the ability to install personal R packages.

```shell
docker run --user=docker -p 8080:8080 dashr-base
```
