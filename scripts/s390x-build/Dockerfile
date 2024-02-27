FROM ubuntu@sha256:81bba8d1dde7fc1883b6e95cd46d6c9f4874374f2b360c8db82620b33f6b5ca1

ARG HOME=/root
WORKDIR $HOME

ENV PATH "$HOME/cmake-install/bin:$PATH"

ARG V_CMAKE=3.28.3

ARG ARCH=s390x
ENV ARCH=$ARCH

ARG COMPILER_V=12
ENV COMPILER_V=$COMPILER_V

ARG CC=/usr/bin/$ARCH-linux-gnu-gcc-$COMPILER_V
ENV CC=$CC

ARG CXX=/usr/bin/$ARCH-linux-gnu-g++-$COMPILER_V
ENV CXX=$CXX

ARG RANLIB=/usr/bin/$ARCH-linux-gnu-ranlib
ENV RANLIB=$RANLIB

RUN apt-get update && apt-get upgrade -y \
    && apt-get install gcc-$COMPILER_V-$ARCH-linux-gnu -y \
    && apt-get install g++-$COMPILER_V-$ARCH-linux-gnu -y \
    && apt-get install ninja-build -y \
    && apt-get install curl -y \
    && apt-get install git -y \
    && apt-get -y install gdb-multiarch \
    && apt-get -y install qemu-user \
    && mkdir /etc/qemu-binfmt \
    && ln -s /usr/s390x-linux-gnu /etc/qemu-binfmt/s390x \
    && cd $HOME \
    && curl -LOJ https://github.com/Kitware/CMake/releases/download/v$V_CMAKE/cmake-$V_CMAKE-linux-x86_64.tar.gz \
    && tar -xvf cmake-$V_CMAKE-linux-x86_64.tar.gz \
    && rm cmake-$V_CMAKE-linux-x86_64.tar.gz \
    && mv cmake-$V_CMAKE-linux-x86_64 cmake-install \
    && apt-get purge --auto-remove curl -y \
    && apt-get clean \
    && apt-get autoclean