FROM docker:19.03.6

# Straight copy installation from
# https://github.com/senseyeio/docker-alpine-aws-cli
# MIT licensed

RUN apk update

# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash

# Install build packages
RUN apk add make && apk add curl && apk add openssh

# Install git
RUN apk add git

# Install nodejs
RUN apk add nodejs

# Install yarn
RUN apk add yarn

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk -Uuv add groff less python py-pip
RUN pip install 'awscli==1.18.0'
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
