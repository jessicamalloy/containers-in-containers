# Why not just build Dockerfile-inner on the outside?

If there's something you need to build Dockerfile-inner that you don't want on your local machine and/or use outer Dockerfile to create a consistent environment to build Dockerfile-inner

OR if other tools are building and running containers for you (at AI2, CDK or a Python script), and they need a consistent environment

# Docker commands

`docker build -t outer-container .`

The important bit here is mounting the docker socket so the containers can talk to each other <br>
`docker run -it -v /var/run/docker.sock:/var/run/docker.sock outer-container /bin/bash`

`docker build -t inner-container -f Dockerfile-inner .`

`docker run inner-container`
