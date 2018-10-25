FROM ubuntu:xenial
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc \
    gcc-arm-linux-gnueabihf \
    libc6-dev \
    libc6-dev-armhf-cross \
    qemu-user-static
ENV CARGO_TARGET_ARMV7_UNKNOWN_LINUX_GNUEABIHF_LINKER=arm-linux-gnueabihf-gcc \
    QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf \
    RUST_TEST_THREADS=1

# 
RUN dpkg --add-architecture armhf
RUN	echo '# source urls for armhf \n\
	deb [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ xenial main \n\
	deb-src [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ xenial main \n\
	deb [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ xenial-updates main \n\
	deb-src [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ xenial-updates main \n\
	deb [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ xenial-security main \n\
	deb-src [arch=armhf] http://ports.ubuntu.com/ubuntu-ports/ xenial-security main \n # end armhf section' >> /etc/apt/sources.list &&\
	sed -r 's/deb h/deb \[arch=amd64\] h/g' /etc/apt/sources.list > /tmp/sources-tmp.list && \
	cp /tmp/sources-tmp.list /etc/apt/sources.list&& \
	sed -r 's/deb-src h/deb-src \[arch=amd64\] h/g' /etc/apt/sources.list > /tmp/sources-tmp.list&&cat /etc/apt/sources.list &&\
	cp /tmp/sources-tmp.list /etc/apt/sources.list&& echo "next"&&cat /etc/apt/sources.list
# 

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libudev-dev:armhf \
    libsqlite3-dev:armhf \
	libudev-dev libsqlite3-dev