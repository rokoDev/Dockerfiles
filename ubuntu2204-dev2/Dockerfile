FROM rokodev/ubuntu2204-dev@sha256:77b9c08bbd17778877b42508c176bda0dc4e116885eecfeaf3ef3fcbdf750fc0

RUN apt update && apt upgrade -y \
    && apt install vim -y \
    && echo "set number" > ~/.vimrc

WORKDIR /home/projects