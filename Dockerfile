FROM docker:latest

MAINTAINER Kirill Garbar <kirill@iterium.co.uk>

RUN set -xe \
    && apk --no-cache add --virtual .build-deps py2-pip py-setuptools \
    && apk --no-cache add groff less python2 curl \
    && pip --no-cache-dir install awscli \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

RUN set -xe \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl
