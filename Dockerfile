FROM debian:jessie
RUN apt-get update -y -q && apt-get upgrade -y -q && apt-get install -y -q openssl
CMD mkdir /work
ADD ./bin /work/bin
VOLUME ['/work/keys']
WORKDIR /work