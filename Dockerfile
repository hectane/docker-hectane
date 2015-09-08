FROM ubuntu:14.04
MAINTAINER Nathan Osman <nathan@quickmediasolutions.com>

# Install Git and the Go compiler for building the application
RUN \
    apt-get update && \
    apt-get install -y git mercurial golang && \
    rm -rf /var/lib/apt/lists/*

# Set the GOPATH and storage location
ENV GOPATH=/root
ENV DIRECTORY=/data

# Grab the source files and build them
RUN go get github.com/nathan-osman/go-cannon

# Specify the executable to run
CMD /root/bin/go-cannon \
        -tls-cert=$TLS_CERT \
        -tls-key=$TLS_KEY \
        -username=$USERNAME \
        -password=$PASSWORD \
        -directory=$DIRECTORY

# Expose the port with the HTTP API
EXPOSE 8025
