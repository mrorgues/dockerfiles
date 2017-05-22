# [Dockerfiles](https://github.com/mrorgues/dockerfiles)

This repository holds various Dockerfiles for images I create.
Some of them are GUI Apps. (Yes, that's right !)

## Requirements

Some of the dockerfiles may use the [ARG](https://docs.docker.com/engine/reference/builder/#arg) keyword.
Hence, docker 1.9+ is required.

## Build your own images

All the images are available [here](https://hub.docker.com/u/mrorgues/). Feel free to pull them!
ex:
```
$ docker pull mrorgues/slack
```

You don't want to use them? No problem! Feel free to build your own images!

###### Run the following command lines:

```
$ git clone https://github.com/mrorgues/dockerfiles.git && cd dockerfiles/<PROJECT>
$ docker login
$ docker build --no-cache -f Dockerfile -t <DOCKER_HUB_REPO>/<PROJECT> .
$ # Or
$ docker build --no-cache --build-arg MY_VAR=my_value -f Dockerfile -t <DOCKER_HUB_REPO>/<PROJECT> .
$ docker push <DOCKER_HUB_REPO>/<PROJECT>

```

## More information
Please find more information here: http://wiki.ros.org/docker/Tutorials/GUI
