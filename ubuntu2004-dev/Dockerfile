FROM ubuntu@sha256:9d42d0e3e57bc067d10a75ee33bdd1a5298e95e5fc3c5d1fce98b455cb879249

WORKDIR /home

RUN apt update && apt upgrade -y \
    && apt install curl -y \
    && apt-get install xz-utils \
    && curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz \
       | tar -xJC . \
    && mv clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-20.04 clang_13 \
    && curl -LOJ https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.tar.gz \
    && tar -xvf cmake-3.23.1-linux-x86_64.tar.gz \
    && rm cmake-3.23.1-linux-x86_64.tar.gz \
    && mv cmake-3.23.1-linux-x86_64 cmake-install \
    && apt-get install -y ninja-build \
    && apt install git -y \
    && apt install vim -y \
    && echo "set number" > ~/.vimrc \
    && mkdir -p /home/projects

ENV PATH=/home/clang_13/bin:/home/cmake-install/bin:$PATH
ENV CC=/home/clang_13/bin/clang
ENV CXX=/home/clang_13/bin/clang++
ENV LD_LIBRARY_PATH=/home/clang_13/lib:$LD_LIBRARY_PATH

LABEL description="This image derived from official ubuntu 20.04 and in addition contains clang 13.0.0, cmake-3.23.1, ninja 1.10.0, git 2.25.1 and vim"

WORKDIR /home/projects