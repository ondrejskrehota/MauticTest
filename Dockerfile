## BUILDING
##   (from project root directory)
##   $ docker build -t ondrejskrehota-mautictest .
##
## RUNNING
##   $ docker run -p 9000:9000 ondrejskrehota-mautictest
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/debian:wheezy-r07

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="uag6xpl" \
    STACKSMITH_STACK_NAME="ondrejskrehota/MauticTest" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-5.6.23-0 --checksum 21f1d65e6f0721cbbad452ace681c5b1a41dec8aabe568140313dce045a0d537

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# PHP base template
COPY . /app
WORKDIR /app

CMD ["php", "-a"]
