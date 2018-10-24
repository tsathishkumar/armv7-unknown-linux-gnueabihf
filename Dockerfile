FROM japaric/armv7-unknown-linux-gnueabihf:v0.1.14

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libudev-dev \
    libsqlite3-dev