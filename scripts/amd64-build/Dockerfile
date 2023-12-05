FROM ubuntu@sha256:149d67e29f765f4db62aa52161009e99e389544e25a8f43c8c89d4a445a7ca37

ARG HOME=/root
WORKDIR $HOME

ENV PATH "$HOME/cmake-install/bin:$PATH"

ARG V_CMAKE=3.27.8

ARG COMPILER_V=12
ENV COMPILER_V=$COMPILER_V

ARG CC=/usr/bin/gcc-$COMPILER_V
ENV CC=$CC

ARG CXX=/usr/bin/g++-$COMPILER_V
ENV CXX=$CXX

ARG RANLIB=/usr/bin/ranlib
ENV RANLIB=$RANLIB

RUN apt-get update && apt-get upgrade -y \
    && apt-get install gcc-$COMPILER_V -y \
    && apt-get install g++-$COMPILER_V -y \
    && apt-get install ninja-build -y \
    && apt-get install curl -y \
    && apt-get install git -y \
    && cd $HOME \
    && curl -LOJ https://github.com/Kitware/CMake/releases/download/v$V_CMAKE/cmake-$V_CMAKE-linux-x86_64.tar.gz \
    && tar -xvf cmake-$V_CMAKE-linux-x86_64.tar.gz \
    && rm cmake-$V_CMAKE-linux-x86_64.tar.gz \
    && mv cmake-$V_CMAKE-linux-x86_64 cmake-install \
    && apt-get purge --auto-remove curl -y \
    && apt-get clean \
    && apt-get autoclean