## go-cannon Container

This container provides up-to-date builds of [go-cannon](https://github.com/nathan-osman/go-cannon), a lightweight SMTP client. If all you want to do is send emails from your webapp, go-cannon is the perfect solution.

### Usage

To quickly deploy an instance of the container, use a command similar to the following:

    docker run \
        -d \
        -p 8025:8025 \
        nathanosman/docker-go-cannon

If you wish to enable HTTP basic auth, be sure to set the `USERNAME` and `PASSWORD` environment variables:

    docker run \
        -e USERNAME=bob \
        -e PASSWORD=passw0rd \
        ...

Enabling TLS is also recommended. You can use a volume to make the certificate and private key available to the container and then set the `TLS_CERT` and `TLS_KEY` environment variables to the appropriate paths:

    docker run \
        -v /home/bob/ssl:/root/ssl \
        -e TLS_CERT=/root/ssl/server.crt \
        -e TLS_KEY=/root/ssl/server.key \
        ...

Emails awaiting delivery in the mail queue are stored in `/data` by default. This location can be changed by setting the `DIRECTORY` environment variable. Using a volume is recommended since you will most likely want to retain the emails between restarts:

    docker run \
        -v /home/bob/go-cannon:/data \
        ...

Some SMTP servers don't have TLS configured correctly, which prevents go-cannon from delivering messages. You can work around this by disabling SSL verification:

    docker run \
        -e DISABLE_SSL_VERIFICATION=1 \
        ...
