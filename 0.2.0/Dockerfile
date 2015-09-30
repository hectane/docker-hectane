FROM ubuntu:14.04
MAINTAINER Nathan Osman <nathan@quickmediasolutions.com>

# Add the compressed tarball from the GitHub release page
ADD https://github.com/nathan-osman/go-cannon/releases/download/v0.2.0/go-cannon_linux_amd64.tar.gz /root/

# Extract the archive
RUN \
    cd /root && \
    tar xf go-cannon_linux_amd64.tar.gz && \
    rm go-cannon_linux_amd64.tar.gz

# Set a few configuration defaults
ENV DIRECTORY=/data \
        DISABLE_SSL_VERIFICATION=0

# Specify the executable to run
CMD /root/go-cannon \
        -tls-cert="$TLS_CERT" \
        -tls-key="$TLS_KEY" \
        -username="$USERNAME" \
        -password="$PASSWORD" \
        -directory="$DIRECTORY" \
        -disable-ssl-verification="$DISABLE_SSL_VERIFICATION"

# Expose the port with the HTTP API
EXPOSE 8025
