# Dockerfiles

To build new image:
---------------------

 1. `cd path/to/dir/with/dockerfile`
 2. `docker build --tag DockerHubLogin/newimagename:1.0 .`

or via docker-compose(at first we must have our `Dockerfile` and `compose.yaml` to be created in one folder)
 1. `cd path/to/dir/with/dockerfile/and/compose/yaml`
 2. `docker-compose build --no-cache --parallel`

To set environment variables:
-----------------------------
`cd scripts`
`. ./set-environment.sh -rs`

To be pushed to the DockerHub successfully an image name must match to pattern:
--------------------------------------------------------------------------------

 docker tag ImageHash DockerHubLogin/ImageName:Tag
 example: `docker tag 4b8f4b0559ed myname/mysuperimage:1.0`

Example of container creation from an image:
--------------------------------------------

 `docker run -it --platform linux/s390x -t -d --name ubuntu_s390x s390x/ubuntu:22.04 /bin/bash`
or
 `docker run -it -t -d --name ubuntu_x86 amd64/ubuntu:22.04 /bin/bash`
or via docker compose:
 `docker compose up -d`


Example of container creation with shared folder and network from an image:
--------------------------------------------
`docker run -it --platform linux/s390x --net z_network --ip 172.20.0.10 -p 3333:22 -t -d -v $HOME/myproject/build/s390x:$HOME/myproject/build/s390x --name ubuntu_z s390x/ubuntu:22.04 /bin/bash`

List available networks:
------------------------
`docker network ls`

Show info about network s390x_default:
--------------------------------------
`docker network inspect s390x_default`

Show info about port mapping(host port will be followed by the container port):
-------------------------------------------------------------------------------
`docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a`


Open running conrainer in terminal:
-----------------------------------
 `docker exec -it ubuntu_s390x bash`
or
 `docker exec -it ubuntu_x86 bash`

Stop all running containers:
----------------------------
`docker stop $(docker ps -a -q)`

Remove all running containers:
------------------------------
`docker rm $(docker ps -a -q)`

To safe login:
---------------------

 `echo "DockerHubPassword" | docker login -u DockerHubLogin --password-stdin`

 or

 `cat $HOME/Documents/dockerhub_tokens/rw.txt | docker login --username rokodev --password-stdin`
 
 `--password-stdin` flag instruct Docker to read your password or token from STDIN and prevent it to be captured in shell history or in CI job logs.

 Next method to login is unsafe and therefore should be escaped:
  `docker login -u DockerHubLogin -p DockerHubPassword`

To push container to DockerHub:
------------------------------------------

 `docker push DockerHubLogin/ImageName:Tag`