# plotly/dashr:ci

#### This Dockerfile is currently used to support integration and unit tests in the [Dash for R](https://github.com/plotly/dashR) repository.

## Usage

This image is pulled from within dashR's [config.yml](https://github.com/plotly/dashR/blob/dev/.circleci/config.yml):

```yaml
    docker:
      - image: plotly/dashr:ci
```

## Publication details

[plotly/dashr:ci](https://hub.docker.com/r/plotly/dashr/tags)

## Limitations

The current revision of this Dockerfile fixes the R version at a given release, so only manual updating is possible. The image bundles in a lot of R packages to speed up testing, but can take nearly an hour to build. The images is approximately 1.4 GB in size.
