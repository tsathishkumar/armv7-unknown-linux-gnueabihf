FROM parity/rust-arm:gitlab-ci

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsqlite3-dev libsqlite3-dev:armhf