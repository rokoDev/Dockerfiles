FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
 xz-utils \
 git \
 curl \
 sudo \
 vim \
 build-essential \
 manpages-dev \
 libssl-dev \
 && rm -rf /var/lib/apt/lists/*

RUN curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz \
 | tar -xJC . && \
 mv clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04 clang_11

ENV PATH=/clang_11/bin:/cmake-install/bin:$PATH
ENV CC=/clang_11/bin/clang
ENV CXX=/clang_11/bin/clang++
ENV LD_LIBRARY_PATH=/clang_11/lib:$LD_LIBRARY_PATH


RUN curl -LOJ https://github.com/Kitware/CMake/releases/download/v3.19.1/cmake-3.19.1-Linux-x86_64.tar.gz && \
 tar -xvf cmake-3.19.1-Linux-x86_64.tar.gz && \
 rm cmake-3.19.1-Linux-x86_64.tar.gz && \
 mv cmake-3.19.1-Linux-x86_64 cmake-install

WORKDIR /usr/src/app