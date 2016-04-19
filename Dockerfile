FROM ubuntu:14.04.2

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/fe PACKFILE=falcon-fe.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json

# Volume
VOLUME $CONFIGDIR

# Package
RUN \
  apt-get update &&\
  apt-get install -y ca-certificates

# Install Open-Falcon Fe Component
ADD $PACKFILE $WORKDIR
COPY $CONFIGFILE $CONFIGDIR/
RUN ln -s $CONFIGDIR/$CONFIGFILE $WORKDIR/

WORKDIR /root
COPY run.sh ./

# Port
EXPOSE 1234 1235

# Start
CMD ["./run.sh"]
