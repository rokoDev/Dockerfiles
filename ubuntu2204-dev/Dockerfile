FROM ubuntu@sha256:c18eff699e090d6b0336dda55b9f83cbbdf126100aa06d16de4fc58e2fa740df

RUN apt update && apt upgrade -y \
    && apt-get install -y build-essential libssl-dev \
    && apt-get install -y ninja-build \
    && apt install git -y
RUN apt install wget -y \
    && cd /tmp \
    && wget https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz \
    && tar -zxvf cmake-3.23.1.tar.gz \
    && cd cmake-3.23.1 \
    && ./bootstrap \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf * \
    && apt-get purge --auto-remove wget -y \
    && apt-get clean \
    && apt-get autoclean
LABEL description="This image derived from official ubuntu 22.04 and in addition contains build-essential tools(gcc 11.2.0), cmake-3.23.1, ninja and git"
RUN mkdir -p /home/projects

WORKDIR /home/projects