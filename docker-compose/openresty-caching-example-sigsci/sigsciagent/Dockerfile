FROM alpine:3.10
ARG AGENT_VERSION=4.0.0

# Image metadata
LABEL com.signalsciences.sigsci-agent="${AGENT_VERSION}"
LABEL version="${AGENT_VERSION}"
LABEL maintainer="Signal Sciences <support@signalsciences.com>"

# Use root during build (to prevent issues with FROM above being
# changed to something that results in non-root)
USER root

# Updates
# - Deal with some issue with golang binaries looking for nsswitch.conf
# - Add in the trusted CA certs for TLS
# - Create a user/group and run as that user instead of root
RUN echo 'hosts: files dns' > /etc/nsswitch.conf && apk --no-cache add ca-certificates && addgroup -S sigsci && adduser -h /sigsci -S -G sigsci sigsci
RUN apk update && apk add rpcbind busybox-extras curl && rm -rf /var/cache/apk/*

# Setup the sigsci directory structure under a common /sigsci
#  bin: sigsci-agent binaries
#  tmp: separate (writeable) volume so rootfs can be mounted RO
#  tmp/sigsci.sock: Default location for rpc-address socket file
#  tmp/cache: Default shared-cache-dir
USER sigsci
RUN mkdir -m 0700 -p /sigsci/bin && mkdir -m 0700 -p /sigsci/tmp


WORKDIR /tmp
RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz \
    && tar -xvf sigsci-agent_latest.tar.gz \
    && mv sigsci-agent /sigsci/bin/sigsci-agent
COPY contrib/start.sh /app/start.sh
RUN chmod 0500 /sigsci /sigsci/bin/*
WORKDIR /sigsci
VOLUME /sigsci/tmp

# UNIX domain socket default (/var/run/sigsci.sock) does not work
# well in docker (especially if rootfs mounted RO), so use a
# volume mountpoint by default for writeable items (socket, cache)
ENV SIGSCI_RPC_ADDRESS=/sigsci/tmp/sigsci.sock
ENV SIGSCI_SHARED_CACHE_DIR=/sigsci/tmp/cache

#COPY agent.conf /etc/sigsci/agent.conf

WORKDIR /app
# Run the sigsci-agent binary on startup. Configure the
# sigsci-agent via ENV or pass in command line flags.
# ENTRYPOINT [ "/sigsci/bin/sigsci-agent" ]
ENTRYPOINT [ "/app/start.sh" ]
