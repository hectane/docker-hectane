FROM golang:latest
MAINTAINER Nathan Osman <nathan@quickmediasolutions.com>

# Grab the source files and build them
RUN go get github.com/nathan-osman/go-cannon

# Set the storage location
ENV DIRECTORY=/data

# Specify the executable to run
CMD go-cannon \
        -tls-cert=$TLS_CERT \
        -tls-key=$TLS_KEY \
        -username=$USERNAME \
        -password=$PASSWORD \
        -directory=$DIRECTORY

# Expose the port with the HTTP API
EXPOSE 8025
