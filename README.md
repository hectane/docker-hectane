## go-cannon Container

This container provides up-to-date builds of [go-cannon](https://github.com/nathan-osman/go-cannon), a lightweight SMTP client. If all you want to do is send emails from your webapp, go-cannon is the perfect solution.

### Usage

To quickly deploy an instance of the container, use a command similar to the following:

    docker run \
        -d \
        -p 8025 \
        nathanosman/go-cannon
