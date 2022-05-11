# Dockerfiles

To build new image:
---------------------

 1. `cd path/to/dir/with/dockerfile`
 2. `docker build --tag DockerHubLogin/newimagename:1.0 .`

To be pushed to the DockerHub successfully an image name must match to pattern:
--------------------------------------------------------------------------------

 docker tag ImageHash DockerHubLogin/ImageName:Tag
 example: `docker tag 4b8f4b0559ed myname/mysuperimage:1.0`

To run container from image:
---------------------------------

 `docker run --rm -it newimagename:1.0 /bin/sh`

To safe login:
---------------------

 `echo "DockerHubPassword" | docker login -u DockerHubLogin --password-stdin`

 Next method to login is unsafe and therefore should be escaped:
  `docker login -u DockerHubLogin -p DockerHubPassword`

To push container to DockerHub:
------------------------------------------

 `docker push DockerHubLogin/ImageName:Tag`