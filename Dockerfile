FROM japaric/armv7-unknown-linux-gnueabihf:v0.1.14

RUN apt-get update && \
    apt-get install libudev-dev && \
    apt-get install libsqlite3-dev