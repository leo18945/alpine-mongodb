![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-mongodb

_MongoDB based on Alpine Linux Edge running as unprivileged User_

[![Docker Automated Build](https://img.shields.io/docker/automated/leo18945/alpine-mongodb.svg)](https://hub.docker.com/r/leo18945/alpine-mongodb/) [![Docker Pulls](https://img.shields.io/docker/pulls/leo18945/alpine-mongodb.svg)](https://hub.docker.com/r/leo18945/alpine-mongodb/) [![Image Size](https://img.shields.io/microbadger/image-size/leo18945/alpine-mongodb/latest.svg)](https://hub.docker.com/r/leo18945/alpine-mongodb/tags/)

[![Build with alpine 3.8](https://img.shields.io/badge/build%20with%20alpine-3.8-blue.svg)](https://github.com/alpinelinux/docker-alpine/) [![Build with dumb-init 1.2.1](https://img.shields.io/badge/build%20with%20dumb--init-1.2.1-blue.svg)](https://github.com/Yelp/dumb-init/tree/v1.2.1/) [![Build with mongodb 3.6.7](https://img.shields.io/badge/build%20with%20mongodb-3.6.7-blue.svg)](https://github.com/mongodb/mongo/tree/v3.6/)

- Github: &nbsp;[leo18945/alpine-mongodb](https://github.com/leo18945/alpine-mongodb)
- Docker: [leo18945/alpine-mongodb](https://hub.docker.com/r/leo18945/alpine-mongodb)

## About the Container

As Base Image i use [Alpine Linux](https://alpinelinux.org/) which is lightweight Distribution with a small surface area for security concerns, but with enough functionality for development and interactive debugging.

To prevent zombie reaping processes i run [dumb-init](https://github.com/Yelp/dumb-init) as PID 1 which forwards signals to all processes running in the container.

It's very fast to stop the container when you use this image compare to none init image, this is very important.

## Configuration Parameter

_These Settings are **optional**, if not set the default values will be used._

```
# Optional Configuration Parameter
ARG SERVICE_USER      # Mongo User
ARG SERVICE_HOME      # Mongo Database Directory
ARG SERVICE_PORT      # Mongo Port
ARG SERVICE_LOGFILE   # Mongo Logfile
ARG SERVICE_LOGLEVEL  # Mongo Loglevel

# Default Settings
ENV SERVICE_USER ${SERVICE_USER:-mongo}
ENV SERVICE_HOME ${SERVICE_HOME:-/data/db}
ENV SERVICE_PORT ${SERVICE_PORT:-27017}
ENV SERVICE_LOGFILE ${SERVICE_LOGFILE:-/data/log/mongod.log}
ENV SERVICE_LOGLEVEL ${SERVICE_LOGLEVEL:-vvv}
```

Documentation: <https://docs.docker.com/compose/compose-file/#/args>

## Run Mongodb

Run mongodb in background, and then attach to container.

```shell
$ docker run --name my_mongodb -d leo18945/alpine-mongodb
$ docker exec -it my_mongodb mongo
> 
> db.version()
3.6.7
> use test
switched to db test
>
```

Run mongodb and immediately into mongo shell.

```shell
$ docker run -it leo18945/alpine-mongodb mongo
> 
> db.version()
3.6.7
> use test
switched to db test
>
```

Run mongodb as executable.

```shell
$ echo 'docker run -it leo18945/alpine-mongodb mongo' > /usr/local/bin/mongo
$ chmod +x /usr/local/bin/mongo
$ mongo
> 
> db.version()
3.6.7
> use test
switched to db test
>
```

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/leo18945/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/leo18945/)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/leo18945/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/leo18945/)
