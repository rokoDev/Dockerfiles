FROM cimg/base:stable

WORKDIR /home/circleci
 
RUN curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz \
 | tar -xJC . && \
 mv clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-20.04 clang_13

ENV PATH=/home/circleci/clang_13/bin:/home/circleci/cmake-install/bin:$PATH
ENV CC=/home/circleci/clang_13/bin/clang
ENV CXX=/home/circleci/clang_13/bin/clang++
ENV LD_LIBRARY_PATH=/home/circleci/clang_13/lib:$LD_LIBRARY_PATH


RUN curl -LOJ https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.tar.gz && \
 tar -xvf cmake-3.23.1-linux-x86_64.tar.gz && \
 rm cmake-3.23.1-linux-x86_64.tar.gz && \
 mv cmake-3.23.1-linux-x86_64 cmake-install

RUN sudo apt-get update -y
RUN sudo apt-get install -y ninja-build

RUN sudo apt-get install python3-pip
RUN pip3 install python-decouple

WORKDIR /home/circleci/project